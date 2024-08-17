module VisualPlotsExt

using Plots: plot!, @recipe, @userplot
import VisualExamples: plotsmylineplot, plotsmylineplot!
using VisualExamples: MyContainer

# Type Recipe
@recipe _(::Type{MyContainer}, cont::MyContainer) = (cont.x, cont.y)
# @recipe _(cont::MyContainer) = (cont.x, cont.y)

# Series Recipe
@userplot PlotsMyLinePlot

@recipe function _(plotobj::PlotsMyLinePlot)
    seriestype := :plotsmylineplot
    x = plotobj.args[1]
    y = plotobj.args[2]
    @assert x isa AbstractVector{<:Real}
    @assert y isa AbstractVector{<:Real}
    (x, y)
end

@recipe function _(::Type{Val{:plotsmylineplot}}, x, y, z)
    x := x
    y := y
    seriestype := :line
    ()
end

end