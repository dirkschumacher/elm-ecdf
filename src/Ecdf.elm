module Ecdf exposing (estimate)

{-| Estimate an empirical distribution function from a list of numbers
-}


estimate : List Float -> (Float -> Float)
estimate data =
    let
        sortedData =
            List.sort data

        n =
            toFloat (List.length data)

        countLeq x =
            List.foldl
                (\el acc ->
                    if el <= x then
                        acc + 1
                    else
                        acc
                )
                0
                sortedData
    in
        \x -> (countLeq x) / n
