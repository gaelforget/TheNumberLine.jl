
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
function make_hist(;max_value=5.0,max_count=5,aspect_ratio=2.0)
        f=Figure(resolution = (aspect_ratio*800, 800), fontsize=32.0)
        a=Axis(f[1,1],xticks=collect(-max_value:max_value),yticks=collect(0.0:max_count),
                xgridcolor=:black,ygridcolor=:black,xgridwidth=0.5,ygridwidth=0.5)
        lines!(a,[0.0,0.0],[0.0,max_count],color=:red,linewidth=2.0)
        xlims!(a,(-max_value,max_value))
        ylims!(a,(0.0,max_count))
        f
end

function save_hist(fig::Makie.Figure;file=joinpath(tempdir(),"histogram_template.png")) 
        save(file,fig) 
        file
end

end
