module Main exposing (..)

import Ecdf exposing (..)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "ecdf"
        [ test "can estimate a simple ecdf" <|
            \_ ->
                let
                    input =
                        [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
                in
                    Expect.equal (Just 0.5) (ecdf 5 input)
        , test "fails if no data" <|
            \_ ->
                Expect.equal Nothing (ecdf 5 [])
        ]


confBandSuite : Test
confBandSuite =
    describe "confidenceBands"
        [ test "can estimate a lower confidence limit for a value" <|
            \_ ->
                let
                    alpha =
                        0.05

                    n =
                        100

                    x =
                        0.3

                    expected =
                        0.1641898
                in
                    equalWithin expected (confidenceBandLower alpha n x)
        , test "lower limit never smaller that 0" <|
            \_ ->
                let
                    alpha =
                        0.05

                    n =
                        10

                    x =
                        0.1

                    expected =
                        0
                in
                    equalWithin expected (confidenceBandLower alpha n x)
        , test "can estimate a upper confidence limit for a value" <|
            \_ ->
                let
                    alpha =
                        0.05

                    n =
                        10

                    x =
                        0.3

                    expected =
                        0.7294694
                in
                    equalWithin expected (confidenceBandUpper alpha n x)
        , test "upper limit never greater that 1" <|
            \_ ->
                let
                    alpha =
                        0.05

                    n =
                        10

                    x =
                        0.9

                    expected =
                        1
                in
                    equalWithin expected (confidenceBandUpper alpha n x)
        ]


equalWithin : Float -> Float -> Expectation
equalWithin x y =
    let
        msg =
            "Two values " ++ (toString x) ++ " and " ++ (toString y) ++ " not equal"
    in
        Expect.true msg ((abs (x - y)) < 0.0001)
