module TheNumberLine

using Luxor

export NumberLinePlot, NumberLineExpression
export aSlider, markers, arrows

include("main_elements.jl")
include("standard_number_line.jl")

end
