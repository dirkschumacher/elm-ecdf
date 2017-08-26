# elm-ecdf
Empirical distribution function in elm (WIP)

This is work in progress!

## Example

```elm
cdf : Float -> Float
cdf = estimate [1, 2, 3, 5, 6, 7, 8, 9, 10]

cdf 5 -- Should be 0.5

```
