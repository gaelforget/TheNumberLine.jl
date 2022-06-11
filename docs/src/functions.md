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

## User Directions

### 1. Open Cloud

You can try `TheNumberLine.jl` in the cloud without having to install anything.

[![Dev](https://img.shields.io/badge/open-cloud-blue.svg)](https://gesis.mybinder.org/v2/gh/JuliaClimate/Notebooks/HEAD?urlpath=lab)

### 2. Private Computer

If instead you want to use `TheNumberLine.jl` then proceed as follows.

1. Download [TheNumberLine.jl](https://github.com/gaelforget/TheNumberLine.jl)
2. Open a terminal window go to the `TheNumberLine.jl/src/` folder
3. Start [Pluto.jl](https://github.com/fonsp/Pluto.jl) e.g. via `julia -e "using Pluto; Pluto.run()"`
4. In web browser window, select and open `standard_number_line.jl`

!!! tip
    Some tips for new users are provided below.

- To use `TheNumberLine.jl` on your own computer, you'll need to download [Julia itself](https://docs.julialang.org/en/v1/) beforehand.
- to close the session you want to go back to the terminal window and `Press Ctrl+C`

## Main Functions

```@docs
NumberLinePlot
NumberLineExpression
make_hist
save_hist
```

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

