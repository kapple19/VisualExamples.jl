module VisualExamples

export MyContainer
export mylineplot
export mylineplot!

import Base: get_extension
# using Base: stacktrace

struct MyContainer
    x::Vector{Int}
    y::Vector{Int}
end

# Plotting Extension Handling
const CURRENT_BACKEND = Ref{Union{Missing, Module}}(missing)
const PLOTTING_EXTENSION_NAMES = (:VisualMakieExt, :VisualPlotsExt)

function set_active_backend!(backend::Module)
    Symbol(backend) in PLOTTING_EXTENSION_NAMES || error("$backend is not a plotting backend of `VisualExamples`.")
    CURRENT_BACKEND[] = backend
end

function current_plotting_backend()
    active_backends = [
        get_extension(VisualExamples, name)
        for name in PLOTTING_EXTENSION_NAMES
        if get_extension(VisualExamples, name) |> isnothing |> !
    ]

    if active_backends |> isempty
        @info 1
        error("No plotting backends loaded.")
    elseif CURRENT_BACKEND[] |> ismissing
        @info 2
        set_active_backend!(active_backends[1])
    elseif CURRENT_BACKEND[] ∉ active_backends
        @info 3
        @warn "Current backend is not active. Setting to $(active_backends[1])."
        set_active_backend!(active_backends[1])
    end

    return CURRENT_BACKEND[]
end

current_plotting_backend_val() = current_plotting_backend() |> Symbol |> Val

# Now to dispatch to the right plotting backend
function makiemylineplot end
function makiemylineplot! end

function plotsmylineplot end
function plotsmylineplot! end

mylineplot(::Val{:VisualMakieExt}, args...; kw...) = makiemylineplot(args...; kw...)
mylineplot(::Val{:VisualPlotsExt}, args...; kw...) = plotsmylineplot(args...; kw...)
mylineplot(args...; kw...) = mylineplot(current_plotting_backend_val(), args...; kw...)

mylineplot!(::Val{:VisualMakieExt}, args...; kw...) = makiemylineplot!(args...; kw...)
mylineplot!(::Val{:VisualPlotsExt}, args...; kw...) = plotsmylineplot!(args...; kw...)
mylineplot!(args...; kw...) = mylineplot!(current_plotting_backend_val(), args...; kw...)

end