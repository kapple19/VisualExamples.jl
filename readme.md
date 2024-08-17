# VisualExamples

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://kapple19.github.io/VisualExamples.jl/stable/)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://kapple19.github.io/VisualExamples.jl/dev/)
[![Build Status](https://github.com/kapple19/VisualExamples.jl/actions/workflows/CI.yml/badge.svg?branch=main)](https://github.com/kapple19/VisualExamples.jl/actions/workflows/CI.yml?query=branch%3Amain)
[![Aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

The purpose of this repository is to demonstrate the use of Julia extension packages that have overlapping functionalities,
such as supporting two plotting backends.

If anyone has improvements, feel free to open a pull request.

Working features:

* `mylineplot(::AbstractVector{<:Real}, ::AbstractVector{<:Real})` seems to dispatch well to both `Makie` and `Plots` _in individual environments where only one of them is added_. See </demo_makie> and </demo_plots>. </demo> is not working.

Current issues:

* Can't get `CairoMakie` and `Plots` in a room together. One or the other seems to throw errors at the `]add *` stage, depending on which order I `]add` them.

* Needed to manually `]add CairoMakie@`. Just `]add CairoMakie` without a version number had issues with [AbstractPlotting.jl](https://github.com/JuliaPlots/AbstractPlotting.jl) being added when it's deprecated.

* Can't get `mylineplot(::MyContainer)` (dispatches to `plotsmylineplot(::MyContainer)`) working. Plots.jl recipes have always frustrated me, I'm not bothered to look into this further.

* I regret the name of this package, and am too lazy to change it.
