```@meta
CurrentModule = TheNumberLine
```

# TheNumberLine.jl

The **Number Line** is a common teaching tool in e.g. K-12 math classes accross the U.S.

_This package is in early development stage when breaking changes are to be expected._

**Authors:** Gael Forget and Jane Chapin

[![DOI](https://zenodo.org/badge/293410387.svg)](https://zenodo.org/badge/latestdoi/293410387)

## Use Example

Once you are looking at [standard\_number\_line.jl](standard_number_line.html) via [Pluto.jl](https://juliaclimate.github.io/Notebooks/#directions) in your web-browser:

- type a number in the text box
- click on the `add` button
- repeat or reset

Repeat a few times, e.g. with other numbers, to obtain something like the image shown below on the right hand side. You can also hit `start over` at any point (left hand side image).


Start           |  Add
:--------------:|:--------------:
![reset](https://user-images.githubusercontent.com/20276764/113902244-acd17580-979d-11eb-8159-92b45bea38bb.png) | ![reset](https://user-images.githubusercontent.com/20276764/113902286-b529b080-979d-11eb-93b2-50a6174517ec.png)


## Exercises

### 1. 

In the first code cell of `standard_number_line.jl`, where values are entered, you can use a list of a slider instead by replacing the _...@bind b htm..._ line with:

```@docs
`Select value of x from the list : `
` ` $(@bind b Select(["4","3","2","1","0","-1","-2","-3","-4"],default="0"))
```

or

```@docs
`Choose value of x using slider : `
` ` $(@bind b aSlider(-10:10; default=0))
```
	
### 2. 

To restrict the number line to using integers (as opposed to reals), try changing `TestType` in `standard_number_line.jl`.

```@docs
TestType=Number; NumberLineType=Float64; "Number LineType = $(NumberLineType)"
#TestType=Int; NumberLineType=Int; "NumberLineType = $(NumberLineType)"
```
	
### 3.

In the _random turtle_ activity we take a series of N consecutive, random, steps on the number line. Each step is either `-1` (left) or `+1` (right) based on a coin flip. We do this N times in a row (10 times for example) and observe our final value at the end (green arrow). All you need to do this is copy the following line to a new code cell and run it:

```
NumberLinePlot(rand((-1,1),10))
```

The activity basically is _do this a bunch of times and discuss how results can vary_
.

## Main Functions

```@docs
NumberLinePlot
NumberLineExpression
```

## Get Started

1. Download [TheNumberLine.jl](https://github.com/gaelforget/TheNumberLine.jl)
2. Open a terminal window & enter the folder called `TheNumberLine.jl/`
3. Start [Pluto.jl](https://github.com/fonsp/Pluto.jl) e.g. via `julia --project=./ test/runPluto.jl`
4. In the web browser window, open `src/standard_number_line.jl`

!!! tip

- if it's your first time using `TheNumberLine.jl` then you may need (once as a pre-requisite) to download [Julia itself](https://docs.julialang.org/en/v1/) and add packages (e.g. `using Pkg; Pkg.add("TheNumberLine")`; see [package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/))
- to close the session you want to go back to the terminal window and `Press Ctrl+C`
