module Main exposing (..)

import Ecdf exposing (estimate)
import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


suite : Test
suite =
    describe "The Ecdf module"
        [ describe "estimate"
            [ test "can estimate a simple ecdf" <|
                \_ ->
                    let
                        input =
                            [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]

                        cdf =
                            estimate input
                    in
                        Expect.equal 0.5 (cdf 5)
            ]
        ]
