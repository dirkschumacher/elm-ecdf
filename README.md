[![Project Status: WIP – Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)


# elm-ecdf
Empirical distribution function in elm (WIP)

This is work in progress!

## Features

* Estimate an empirical distribution function
* Generate confidence bands around that function using the [Dvoretzky–Kiefer–Wolfowitz inequality](https://en.wikipedia.org/wiki/Dvoretzky%E2%80%93Kiefer%E2%80%93Wolfowitz_inequality)

## Example

```elm
-- F_hat(x <= 5)
ecdf 5 [1, 2, 3, 5, 6, 7, 8, 9, 10] -- Just 0.5
```
