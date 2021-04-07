using TheNumberLine
using Test
#using Luxor
#using Pluto

@testset "TheNumberLine.jl" begin
    include("../src/standard_number_line.jl")
    push!(ii,-2.0)
    plt=NumberLinePlot(ii)
    @test NumberLineExpression(ii)=="Expression : 0-2.0"
end
