var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = TheNumberLine","category":"page"},{"location":"#TheNumberLine","page":"Home","title":"TheNumberLine","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"The Number Line is a common teaching tool in e.g. K-12 math classes accross the U.S.","category":"page"},{"location":"","page":"Home","title":"Home","text":"This package is in early development stage when breaking changes are to be expected.","category":"page"},{"location":"","page":"Home","title":"Home","text":"Authors: Gael Forget and Jane Chapin","category":"page"},{"location":"","page":"Home","title":"Home","text":"(Image: DOI)","category":"page"},{"location":"#Instructions","page":"Home","title":"Instructions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Download https://github.com/gaelforget/TheNumberLine.jl\nOpen a terminal window & enter TheNumberLine.jl/ folder\nRun julia --project=./ src/run.jl\nProceed as prompted in the terminal to open notebook1.jl via Pluto.jl","category":"page"},{"location":"","page":"Home","title":"Home","text":"Tips:","category":"page"},{"location":"","page":"Home","title":"Home","text":"the instructions prompted in the terminal will let you use TheNumberLine in your web browser as a Pluto notebook called notebook1.jl\nfirst time using TheNumberLine.jl? you may need, but only once as a pre-requisite, to download Julia itself and then add TheNumberLine.jl and Pluto.jl via the package manager\nto close the program / close TheNumberLine.jl off, you want to go back to the terminal window and Press Ctrl+C","category":"page"},{"location":"#Use-Example","page":"Home","title":"Use Example","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Once you are looking at notebook1.jl via Pluto.jl in your web-browser, type a number of your choice in the text box and hit add to number line. Repeat a few times, e.g. with other numbers, to obtain something like the graph shown on the right hand side. To go back to the starting point, hit reset the number line (left hand sode graph).","category":"page"},{"location":"","page":"Home","title":"Home","text":"Reset Add\n(Image: reset) (Image: reset)","category":"page"},{"location":"#Main-Functions","page":"Home","title":"Main Functions","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"NumberLinePlot\nNumberLineExpression","category":"page"},{"location":"#TheNumberLine.NumberLinePlot","page":"Home","title":"TheNumberLine.NumberLinePlot","text":"NumberLinePlot(x)\n\nDisplay the number line sequence of operations, defined by vector x, as a graph.\n\n\n\n\n\n","category":"function"},{"location":"#TheNumberLine.NumberLineExpression","page":"Home","title":"TheNumberLine.NumberLineExpression","text":"NumberLineExpression(x)\n\nDisplay the number line sequence of operations, defined by vector x, as text.\n\n\n\n\n\n","category":"function"},{"location":"#Customization","page":"Home","title":"Customization","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"In the first code cell of  notebook1.jl, simply replace the text box input widget","category":"page"},{"location":"","page":"Home","title":"Home","text":"`Type value of x in text box : ` \n\n` x = ` $(@bind b html\"<input type=text>\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"for example with a drop down menu ","category":"page"},{"location":"","page":"Home","title":"Home","text":"`Select value of x from the list : `\n` ` $(@bind b Select([\"4\",\"3\",\"2\",\"1\",\"0\",\"-1\",\"-2\",\"-3\",\"-4\"],default=\"0\"))","category":"page"},{"location":"","page":"Home","title":"Home","text":"or with a slider","category":"page"},{"location":"","page":"Home","title":"Home","text":"`Choose value of x using slider : `\n` ` $(@bind b aSlider(-10:10; default=0))","category":"page"},{"location":"","page":"Home","title":"Home","text":"And in the notebook1 last code cell, one can ","category":"page"},{"location":"","page":"Home","title":"Home","text":"TestType=Int; NumberLineType=Int; \"NumberLineType = $(NumberLineType)\"","category":"page"},{"location":"","page":"Home","title":"Home","text":"as follows in orded to allow for real-valued inputs (i.e. not just integers) ","category":"page"},{"location":"","page":"Home","title":"Home","text":"TestType=Number; NumberLineType=Float64; \"Number LineType = $(NumberLineType)\"","category":"page"},{"location":"","page":"Home","title":"Home","text":"which can be advantageous depending on the teacher's goal, e.g. using text box.","category":"page"}]
}