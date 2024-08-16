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

## The Random Turtle

In the `random turtle` activity we take a series of N consecutive, random, steps on the number line. Each step is either `-1` (left) or `+1` (right) based on a coin flip. We do this N times in a row (10 times for example) and observe our final value at the end (green arrow). All you need to do this is copy the following line to a new code cell and run it:

```@example
import TheNumberLine: NumberLinePlot # hide
NumberLinePlot(rand((-1,1),10),path=".",filename="RandomTurtle.png")
nothing # hide
```

![](RandomTurtle.png)

The activity basically is _do this a bunch of times and discuss how results can vary_
.

## Interactive Use

In your web-browser (see [User Directions](@ref) for detail) :

- type a number in the text box
- click on the `add` button
- repeat or reset

Repeat a few times, e.g. with other numbers, to obtain something like the image shown above. You can also hit `start over` at any point.

## Histograms

This module provides a simple way to create an empty histogram that students can print and write over.

```@example
import TheNumberLine: make_hist, save_hist # hide
save_hist(make_hist(),file="hist.png")
nothing # hide
```

![](hist.png)

## Notebook Example

- [standard\_number\_line.html](standard_number_line.html)
- [standard\_number\_line.jl](https://github.com/gaelforget/TheNumberLine.jl/blob/master/src/standard_number_line.jl)

## School Day Table

- [table_school_days.html](table_school_days.html)
- [table_school_days.jl](https://github.com/gaelforget/TheNumberLine.jl/blob/master/src/table_school_days.jl)

