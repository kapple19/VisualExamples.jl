module VisualPlotsExt

using Plots: @recipe
using VisualExamples: MyContainer

@recipe _(::Type{MyContainer}, cont::MyContainer) = (cont.x, cont.y)

end