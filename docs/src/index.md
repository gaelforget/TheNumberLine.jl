```@meta
CurrentModule = TheNumberLine
```

# TheNumberLine.jl

The **Number Line** is a common teaching tool in e.g. K-12 math classes accross the U.S.

_This package is in early development stage when breaking changes are to be expected._

**Authors:** Gael Forget and Jane Chapin

[![DOI](https://zenodo.org/badge/293410387.svg)](https://zenodo.org/badge/latestdoi/293410387)

## How-To

To get started:

1. Download [TheNumberLine.jl](https://github.com/gaelforget/TheNumberLine.jl)
2. Open a terminal window & enter the folder called `TheNumberLine.jl/`
3. Start [Pluto.jl](https://github.com/fonsp/Pluto.jl) e.g. via `julia --project=./ test/runPluto.jl`
4. In the web browser window, open `src/standard_number_line.jl`

_Tips:_

- if it's your first time using `TheNumberLine.jl` then you may need (once as a pre-requisite) to download [Julia itself](https://docs.julialang.org/en/v1/) and add packages (e.g. `using Pkg; Pkg.add("TheNumberLine")`; see [package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/))
- to close the session you want to go back to the terminal window and `Press Ctrl+C`

## Use Example:

Once you are looking at `standard_number_line.jl` via `Pluto.jl` in your web-browser (left image below), type a number of your choice in the text box and hit `add`.

Repeat a few times, e.g. with other numbers, to obtain something like the image shown below on the right hand side. You can also hit `start over` at any point.


Start           |  Add
:--------------:|:--------------:
![reset](https://user-images.githubusercontent.com/20276764/113902244-acd17580-979d-11eb-8159-92b45bea38bb.png) | ![reset](https://user-images.githubusercontent.com/20276764/113902286-b529b080-979d-11eb-93b2-50a6174517ec.png)

## Main Functions

```@docs
NumberLinePlot
NumberLineExpression
```

## Customization

In the first code cell of  `notebook1.jl`, simply replace the `text box` input widget

```
`Type value of x in text box : ` 

` x = ` $(@bind b html"<input type=text>")
```

for example with a `drop down menu` 

```
`Select value of x from the list : `
` ` $(@bind b Select(["4","3","2","1","0","-1","-2","-3","-4"],default="0"))
```

or with a `slider`

```
`Choose value of x using slider : `
` ` $(@bind b aSlider(-10:10; default=0))
```

And in the `notebook1` last code cell, one can 

```
TestType=Int; NumberLineType=Int; "NumberLineType = $(NumberLineType)"
```	

as follows in orded to allow for real-valued inputs (i.e. not just integers) 

```
TestType=Number; NumberLineType=Float64; "Number LineType = $(NumberLineType)"
```	

which can be advantageous depending on the teacher's goal, e.g. using `text box`.

