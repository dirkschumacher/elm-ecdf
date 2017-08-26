module Ecdf
    exposing
        ( ecdf
        , confidenceBand
        , confidenceBandLower
        , confidenceBandUpper
        )

{-| Estimate an empirical distribution function from a list of numbers
-}


ecdf : Float -> List Float -> Maybe Float
ecdf x data =
    case data of
        [] ->
            Nothing

        _ ->
            (Just
                ((List.foldl
                    (\el acc ->
                        if el <= x then
                            acc + 1
                        else
                            acc
                    )
                    0
                    data
                 )
                    / toFloat (List.length data)
                )
            )



{-
   Confidence bands using the Dvoretzky–Kiefer–Wolfowitz inequality
   This stackoverflow post gives more information: https://stats.stackexchange.com/questions/181724/confidence-intervals-for-ecdf
   Also see lecture notes of Rui Castro http://www.win.tue.nl/~rmcastro/AppStat2013/files/lecture1.pdf
-}


type alias Interval =
    { lower : Float
    , upper : Float
    }


confidenceBand : Float -> Int -> Float -> Interval
confidenceBand alpha n x =
    { lower = confidenceBandLower alpha n x
    , upper = confidenceBandUpper alpha n x
    }


confidenceBandLower : Float -> Int -> Float -> Float
confidenceBandLower alpha n x =
    max 0 (x - (epsilon alpha n))


confidenceBandUpper : Float -> Int -> Float -> Float
confidenceBandUpper alpha n x =
    min 1 (x + (epsilon alpha n))


epsilon : Float -> Int -> Float
epsilon alpha n =
    (sqrt ((1.0 / (2.0 * (toFloat n))) * (logBase e (2.0 / alpha))))
