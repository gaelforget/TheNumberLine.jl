### A Pluto.jl notebook ###
# v0.11.12

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
begin
	using Plots
	function markers(x)
		m=fill(:rtriangle,size(x))
		m[x.<0] .= :ltriangle
		m[x.==0] .= :dot
		o=fill(-0.5,size(x))
		o[x.<0] .= 0.5
		o[x.==0] .= 0.0
		m,o
	end
	function arrows(x)
		length(x)>0 ? s=size(x) : s=(1,1)
		a=fill("⊚",s)
		p=fill(:center,s)
		if length(x)>1
			a[x.<0] .= "<"
			p[x.<0] .= :left
			a[x.>0] .= ">"
			p[x.>0] .= :right
		end
		a,p    
	end
	function NumberLinePlot(x)
		nx=length(x)
		mul=0.1
		nx>1 ? xx=cumsum([0 ;x[2:end]]) : xx=[0.;0.]
		nx>1 ? yy=mul*collect(0:length(x)-1) : yy=[0.;0.]
		nx>1 ? ylims=mul.*(-1.,nx+1) : ylims=mul.*(-1.,nx)

		x∞=Int(max(1+maximum(abs.(extrema(xx))),10))
		y∞=maximum(yy)
		ticks=collect(-x∞:x∞)
		plt=plot(ticks,0*ticks,marker=:vline,leg=:none,markersize=16,xtick=[-x∞,x∞],c=:black,
			showaxis=false,xlims=(-x∞-1,x∞+1),ylims=ylims,linewidth=4,grid=:none)
		
		annotate!(-x∞,-0.9*mul, Plots.text("$(-x∞)", 16, :black, :right))
		annotate!(x∞,-0.9*mul, Plots.text("$(x∞)", 16, :black, :left))
		
		[plot!(plt,[xx[i];xx[i]],[yy[i];yy[i+1]],line=:dash,c=:black) for i in 1:nx-1]
		[plot!(plt,[xx[i];xx[i+1]],[yy[i+1];yy[i+1]],linewidth=2,c=:black) for i in 1:nx-1]
		plot!(plt,[xx[end];xx[end]],[yy[end];yy[1]],line=:dash,c=:red)

		m,o=markers(x)
		[scatter!(plt,[xx[i]+o[i]],[yy[i]],marker=m[i],markersize=16) for i in 1:nx]

		#a,p=arrows(x)
		#[annotate!(plt,xx[i],yy[i]+0.03*mul,Plots.text(a[i], 14, p[i])) for i in 1:nx]

		plt
	end
end

# ╔═╡ 62e67a9c-ef25-11ea-3589-6f377d7aa788
md"""
`New Value = ` $(@bind b html"<input>")
$(@bind c html"<input type=button value='add to number line'>")
$(@bind d html"<input type=button value='reset number line'>")
"""

# ╔═╡ 78c0fd44-f052-11ea-0264-4378e02814af
#TestType=Number; NumberLineType=Float64; "Number LineType = $(NumberLineType)"
TestType=Int; NumberLineType=Int; "NumberLineType = $(NumberLineType)"	

# ╔═╡ 59f64c2a-f04d-11ea-0498-b3f28ab5d90c
function NumberLineExpression(x)
	tmp1=deepcopy(x)
	xpr=""
	while length(tmp1)>1
		tmp2=NumberLineType(pop!(tmp1))
		tmp2<0 ? xpr="$(tmp2)"*xpr : xpr="+$(tmp2)"*xpr
	end
	"Expression : 0"*xpr
end

# ╔═╡ 7c1434b2-ef25-11ea-0967-d756ec262715
bb = try
	b1=eval(Meta.parse(b))
	!isa(b1,TestType) ? b2=parse(NumberLineType,b1) : b2=b1
	b2
  catch
    NaN
end; "✓"

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

# ╔═╡ c0e46264-ef30-11ea-0b51-adc95104e22f
push!(jj,bb); "✓"

# ╔═╡ Cell order:
# ╟─62e67a9c-ef25-11ea-3589-6f377d7aa788
# ╟─33165978-f050-11ea-33f0-4971b031ee8b
# ╟─4be4ef1e-ef27-11ea-34f7-cd86ba1c36e2
# ╟─f07c3450-ef32-11ea-3f5f-2b0fc747ff80
# ╟─59f64c2a-f04d-11ea-0498-b3f28ab5d90c
# ╟─78c0fd44-f052-11ea-0264-4378e02814af
# ╟─7c1434b2-ef25-11ea-0967-d756ec262715
# ╟─46c870e8-ef2a-11ea-3552-afbc18d117ee
# ╟─c0e46264-ef30-11ea-0b51-adc95104e22f
