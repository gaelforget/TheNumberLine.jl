using TheNumberLine
using Test
using Luxor
using Pluto

@testset "TheNumberLine.jl" begin
    include("../src/notebook1.jl")
    push!(ii,-2.0)
    plt=NumberLinePlot(ii)
    @test prod(isapprox.(xlims(plt),(-11.0,11.0)))
    @test prod(isapprox.(ylims(plt),(-0.1,0.3)))
    @test NumberLineExpression(ii)=="Expression : 0-2"
end
