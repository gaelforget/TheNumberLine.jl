
using Luxor

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
    NumberLinePlot(y; path=tempdir(), filename="tmp.png")

Display the number line sequence of operations, defined by vector `y`, as a graph.
"""    
function NumberLinePlot(y; path=tempdir(), filename="tmp.png")
	x=y[findall((!isnan).(y))]
	
    nx=length(x)
    nx>1 ? xx=cumsum([0 ;x[2:end]]) : xx=[0.;0.]
    nx>1 ? yy=collect(0:length(x)-1) : yy=[0.;0.]
	
    x∞=max(maximum(abs.(extrema(xx))),10)
    y∞=maximum(yy)
	
    xfac=min(x∞,10)/x∞
    yfac=min(y∞+1,10)/(y∞+1)
    f(p::Point) = Point(xfac*200.0*p[1],-yfac*100.0*p[2]+800.0)
	g=10.0
    xdel=Int(ceil(x∞/10))

	@png begin
		setline(0.5g)
		line(f(Point(-x∞,0)), f(Point(x∞,0)), :stroke)
		[line(f(Point(i,+0.5)), f(Point(i,-0.5)), :stroke) for i in -x∞:x∞]
        
        [settext("<span font='80' foreground='red'> -$i </span>",f(Point(-i,-2.0)),
        halign="center",valign="bottom",markup=true,angle=0) for i in xdel:xdel:Int(x∞)]
        settext("<span font='80' foreground='white' background='green'> 0 </span>",f(Point(0,-2.0)),
        halign="center",valign="bottom",markup=true,angle=0)
        [settext("<span font='80' foreground='black'> +$i </span>",f(Point(i,-2.0)),
        halign="center",valign="bottom",markup=true,angle=0) for i in xdel:xdel:Int(x∞)]

		setline(1.5g)
		[line(f(Point(xx[i],yy[i])), f(Point(xx[i],yy[i+1])),:stroke) for i in 1:nx-1]
  		[line(f(Point(xx[i],yy[i+1])), f(Point(xx[i+1],yy[i+1])),:stroke) for i in 1:nx-1]

		setline(1.5g)
	    setcolor(0,0.75,0)
		#line(f(Point(xx[end],yy[end])), f(Point(xx[end],yy[1])),:stroke)
        a=f(Point(xx[end],yy[end]))
        b=f(Point(xx[end],yy[1]))
        yy[end]!==yy[1] ? arrow(a,b,arrowheadlength=5.0g, arrowheadangle=pi/4, linewidth=1.5g) : nothing

    end 5000 2000 joinpath(path,filename)
end

"""
    NumberLineExpression(x)

Display the number line sequence of operations, defined by vector `x`, as text.
"""    
function NumberLineExpression(x)
	tmp1=deepcopy(x)
	xpr=""
	while length(tmp1)>1&&!isnan(tmp1[2])
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

