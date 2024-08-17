module VisualMakieExt

import Makie: convert_arguments
using Makie: AbstractPlot
using VisualExamples: MyContainer

convert_arguments(
    Plot_Type::Type{<:AbstractPlot},
    cont::MyContainer
) = convert_arguments(Plot_Type, cont.x, cont.y)

end