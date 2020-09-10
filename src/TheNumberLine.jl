module TheNumberLine

export 	NumberLinePlot, NumberLineExpression, aSlider, markers, arrows

##

"""
    markers(x)

Setup different markers for use in `NumberLinePlot`.
"""    
function markers(x)
    m=fill(:rtriangle,size(x))
    m[x.<0] .= :ltriangle
    m[x.==0] .= :dot
    o=fill(-0.5,size(x))
    o[x.<0] .= 0.5
    o[x.==0] .= 0.0
    c=fill(:blue,size(x))
    c[x.<0] .= :red
    c[x.==0] .= :green
    m,o,c
end

"""
    arrows(x)

Setup arrows pointing left (in red) or right (in blue) for use in `NumberLinePlot`.
"""    
function arrows(x)
    length(x)>0 ? s=size(x) : s=(1,1)
    a=fill("⊚",s)
    p=fill(:center,s)
    c=fill(:green,s)
    if length(x)>1
        a[x.<0] .= "<"
        p[x.<0] .= :left
        c[x.<0] .= :red
        a[x.>0] .= ">"
        p[x.>0] .= :right
        c[x.>0] .= :blue
    end
    a,p,c   
end

"""
    NumberLinePlot(x)

Display the number line sequence of operations, defined by vector `x`, as a graph.
"""    
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

    m,o,c=markers(x)
    [scatter!(plt,[xx[i]+o[i]],[yy[i]],marker=m[i],color=c[i],markersize=16) for i in 1:nx]

    #a,p=arrows(x)
    #[annotate!(plt,xx[i],yy[i]+0.03*mul,Plots.text(a[i], 14, p[i])) for i in 1:nx]

    plt
end

"""
    NumberLineExpression(x)

Display the number line sequence of operations, defined by vector `x`, as text.
"""    
function NumberLineExpression(x)
	tmp1=deepcopy(x)
	xpr=""
	while length(tmp1)>1
		tmp2=NumberLineType(pop!(tmp1))
		tmp2<0 ? xpr="$(tmp2)"*xpr : xpr="+$(tmp2)"*xpr
	end
	"Expression : 0"*xpr
end

##

import Base.show
	
"""
   aSlider(range::AbstractRange,default::Number,show_value::Bool)

Data type used for sliders in Pluto notebooks
"""    
struct aSlider
    range::AbstractRange
    default::Number
    show_value::Bool
end

aSlider(range::AbstractRange; default=missing, show_value=true) = aSlider(range, (default === missing) ? first(range) : default, show_value)

function show(io::IO, ::MIME"text/html", slider::aSlider)
    print(io, """<input 
        type="range" 
        min="$(first(slider.range))" 
        step="$(step(slider.range))" 
        max="$(last(slider.range))" 
        value="$(slider.default)"
        $(slider.show_value ? "oninput=\"this.nextElementSibling.value=this.value\"" : "")
        >""")
    
    print(io, "  [ x = </output>")

    if slider.show_value
        print(io, """<output>$(slider.default)</output>""")
    end

    print(io, " ] </output>")

end

##

include("notebook1.jl")

end
