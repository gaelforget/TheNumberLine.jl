```@meta
CurrentModule = TheNumberLine

using PlutoUI

macro bind(def, element) # hide
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end
```

# TheNumberLine.jl

The **Number Line** is a common teaching tool in e.g. K-12 math classes accross the U.S.

**Authors:** Gael Forget and Jane Chapin

[![DOI](https://zenodo.org/badge/293410387.svg)](https://zenodo.org/badge/latestdoi/293410387)

!!! warning
    This package is in early development stage when breaking changes are to be expected.

## Use Example

In your web-browser (see [User Directions](@ref) for detail) :

- type a number in the text box
- click on the `add` button
- repeat or reset

Repeat a few times, e.g. with other numbers, to obtain something like the image shown below on the right hand side. You can also hit `start over` at any point (left hand side image).


Start           |  Add
:--------------:|:--------------:
![reset](https://user-images.githubusercontent.com/20276764/113902244-acd17580-979d-11eb-8159-92b45bea38bb.png) | ![reset](https://user-images.githubusercontent.com/20276764/113902286-b529b080-979d-11eb-93b2-50a6174517ec.png)


## Exercises

### Random Turtle

In the `random turtle` activity we take a series of N consecutive, random, steps on the number line. Each step is either `-1` (left) or `+1` (right) based on a coin flip. We do this N times in a row (10 times for example) and observe our final value at the end (green arrow). All you need to do this is copy the following line to a new code cell and run it:

```
NumberLinePlot(rand((-1,1),10))
```

![](tmp.svg)

The activity basically is _do this a bunch of times and discuss how results can vary_
.

### Histograms

This module provides a simple way to create an empty histogram that students can print and write over.

```@example
#using TheNumberLine
import TheNumberLine.histogram_template: make_hist, save_hist

fig=make_hist()
save_hist(fig,file="hist.png")
```

![](hist.png)

## Various

### 1. Use a Slider

In the first code cell of `standard_number_line.jl`, where values are entered, you can use a list of a slider or multiple choice instead.

To do this, replace the line that says

```
` Type value : ` $(@bind b html"<input type=text>")
```

with

```
`Select value of x from the list : ` $(@bind b Select(["4","3","2","1","0","-1","-2","-3","-4"],default="0"))
```

or

```
`Choose value of x using slider : ` $(@bind b aSlider(-10:10; default=0))
```

### 2. Integers Only

To restrict the number line to using integers (as opposed to reals), try changing `TestType` in `standard_number_line.jl`.

To do this, replace the line that says

```
TestType=Number; NumberLineType=Float64; "Number LineType = $(NumberLineType)"
```

with 

```
TestType=Int; NumberLineType=Int; "NumberLineType = $(NumberLineType)"
```

## Main Functions

```@docs
NumberLinePlot
NumberLineExpression
histogram_template.make_hist
```

## User Directions

You can try `TheNumberLine.jl` in the cloud without having to install anything.

[![Dev](https://img.shields.io/badge/open-cloud-blue.svg)](https://gesis.mybinder.org/v2/gh/JuliaClimate/Notebooks/HEAD?urlpath=lab)

If instead you want to use `TheNumberLine.jl` then proceed as follows.

1. Download [TheNumberLine.jl](https://github.com/gaelforget/TheNumberLine.jl)
2. Open a terminal window go to the `TheNumberLine.jl/src/` folder
3. Start [Pluto.jl](https://github.com/fonsp/Pluto.jl) e.g. via `julia -e "using Pluto; Pluto.run()"`
4. In web browser window, select and open `standard_number_line.jl`

!!! tip
    Some tips for new users are provided below.

- To use `TheNumberLine.jl` on your own computer, you'll need to download [Julia itself](https://docs.julialang.org/en/v1/) beforehand.
- to close the session you want to go back to the terminal window and `Press Ctrl+C`
