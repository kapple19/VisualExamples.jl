using Plots
using VisualExamples

cont = MyContainer(1:10, rand(Int, 10))

plot(cont)

mylineplot(cont)
