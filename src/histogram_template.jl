
module histogram_template

using CairoMakie

"""
    make_hist()

```
using TheNumberLine
import TheNumberLine.histogram_template: make_hist, save_hist

fig=make_hist()
save_hist(fig)
```
"""
function make_hist()
        f=Figure()
        a=Axis(f[1,1],xticks=collect(-10.0:10.0),yticks=collect(0.0:10.0),
                xgridcolor=:black,ygridcolor=:black,xgridwidth=0.5,ygridwidth=0.5)
        lines!(a,[0.0,0.0],[0.0,10.0],color=:red)
        xlims!(a,(-10.0,10.0))
        ylims!(a,(0.0,10.0))
        f
end

save_hist(fig::Makie.Figure;file=joinpath(tempdir(),"histogram_template.png")) = save(file,fig) 

end
