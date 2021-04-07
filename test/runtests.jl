using TheNumberLine
using Test
#using Luxor
#using Pluto

@testset "TheNumberLine.jl" begin
    pth=pathof(TheNumberLine)
    include(joinpath(pth,"..","standard_number_line.jl"))
    push!(ii,-2.0)
    plt=NumberLinePlot(ii)
    @test NumberLineExpression(ii)=="Expression : 0-2.0"

    tmp=aSlider(-10:10; default=0)
    @test isa(tmp,aSlider)

    (a,p,c)=arrows(collect(1:3))
    @test a[1]==">"

    (a,p,c)=markers(collect(1:3))
    @test a[1]==:rtriangle
end
