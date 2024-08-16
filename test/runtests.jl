using VisualExamples
using Test
using Aqua
using JET

@testset "VisualExamples.jl" begin
    @testset "Code quality (Aqua.jl)" begin
        Aqua.test_all(VisualExamples)
    end
    @testset "Code linting (JET.jl)" begin
        JET.test_package(VisualExamples; target_defined_modules = true)
    end
    # Write your tests here.
end
