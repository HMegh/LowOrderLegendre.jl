using LowOrderLegendre
using Test
import LegendrePolynomials

@testset "LowOrderLegendre.jl" begin
    # Write your tests here.

    @testset "Comparing to LegendrePolynomials" begin 
        for x in range(-1,1,17), l=0:15,k=0:15
            @test  dnPl(x,l,k) ≈ LegendrePolynomials.dnPl(x,l,k)
        end 
    end
end
