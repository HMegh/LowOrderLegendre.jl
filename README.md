# LowOrderLegendre

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://HMegh.github.io/LowOrderLegendre.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://HMegh.github.io/LowOrderLegendre.jl/dev/)
[![Build Status](https://github.com/HMegh/LowOrderLegendre.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/HMegh/LowOrderLegendre.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Coverage](https://codecov.io/gh/HMegh/LowOrderLegendre.jl/branch/main/graph/badge.svg)](https://codecov.io/gh/HMegh/LowOrderLegendre.jl)


This package provides an implementation of Legendre polynomials and their derivatives. For degrees $\le 15$ the polynomials are calculated directly from their analytic expressions. For higher degrees, this package calls [LegendrePolynomials.jl](https://github.com/jishnub/LegendrePolynomials.jl). 

# Getting started 

## Installation

This package is not registered (yet), to install it use 

```julia
using Pkg;
Pkg.add(url="https://github.com/HMegh/LowOrderLegendre.jl")
```
## Usage 
To compute the `l`-th Legendre polynomial at a point `x`, use `Pl(x,l)`. 

To compute the `k`-th derivative of the `l`-th Legendre polynomial at `x`, use `dnPl(x,l,k)`. 

Example:

```julia-repl 
julia> Pl(.3,10)
0.2514763495160156

julia> dnPl(.3,10,4)
3434.5883446875
```

