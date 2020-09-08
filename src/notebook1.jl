### A Pluto.jl notebook ###
# v0.11.13

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ f07c3450-ef32-11ea-3f5f-2b0fc747ff80
using Plots, TheNumberLine, PlutoUI; "✓"

# ╔═╡ 62e67a9c-ef25-11ea-3589-6f377d7aa788
md"""
`Type value of x in text box : ` 

` x = ` $(@bind b html"<input type=text>")

` ` $(@bind c html"<input type=button value='add to number line'>")
$(@bind d html"<input type=button value='reset number line'>")
"""

# ╔═╡ 46c870e8-ef2a-11ea-3552-afbc18d117ee
begin
	d
	ii=[0.0]
	jj=[]
end; "✓"

# ╔═╡ 4be4ef1e-ef27-11ea-34f7-cd86ba1c36e2
begin
	c
	length(jj)>0 ? push!(ii,jj[end]) : nothing
	smry=NumberLineExpression(ii)
	NumberLinePlot(ii)
end

# ╔═╡ 33165978-f050-11ea-33f0-4971b031ee8b
smry

# ╔═╡ 78c0fd44-f052-11ea-0264-4378e02814af
#TestType=Number; NumberLineType=Float64; "Number LineType = $(NumberLineType)"
TestType=Int; NumberLineType=Int; "NumberLineType = $(NumberLineType)"	

# ╔═╡ 7c1434b2-ef25-11ea-0967-d756ec262715
bb = try
	b1=eval(Meta.parse(b))
	!isa(b1,TestType) ? b2=parse(NumberLineType,b1) : b2=b1
	b2
  catch
    NaN
end; "✓"

# ╔═╡ c0e46264-ef30-11ea-0b51-adc95104e22f
push!(jj,bb); "✓"

# ╔═╡ Cell order:
# ╟─62e67a9c-ef25-11ea-3589-6f377d7aa788
# ╟─33165978-f050-11ea-33f0-4971b031ee8b
# ╟─4be4ef1e-ef27-11ea-34f7-cd86ba1c36e2
# ╟─f07c3450-ef32-11ea-3f5f-2b0fc747ff80
# ╟─7c1434b2-ef25-11ea-0967-d756ec262715
# ╟─46c870e8-ef2a-11ea-3552-afbc18d117ee
# ╟─c0e46264-ef30-11ea-0b51-adc95104e22f
# ╟─78c0fd44-f052-11ea-0264-4378e02814af
