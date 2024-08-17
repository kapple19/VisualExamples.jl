module VisualMakieExt

import Makie: convert_arguments, plot!
using Makie: AbstractPlot, lines!, Theme, @recipe
import VisualExamples: makiemylineplot, makiemylineplot!
using VisualExamples: MyContainer

convert_arguments(
    PlotType::Type{<:AbstractPlot},
    cont::MyContainer
) = convert_arguments(PlotType, cont.x, cont.y)

@recipe(MakieMyLinePlot, x, y) do scene
    Theme()
end

function plot!(plot::MakieMyLinePlot)
    lines!(plot, plot.x[], plot.y[])
    return plot
end

end