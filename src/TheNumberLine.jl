module TheNumberLine

export NumberLinePlot, NumberLineExpression
export aSlider, markers, arrows
export make_hist, save_hist

include("main_elements.jl")
include("standard_number_line.jl")
include("histogram_template.jl")

make_hist=histogram_template.make_hist
save_hist=histogram_template.save_hist

end
