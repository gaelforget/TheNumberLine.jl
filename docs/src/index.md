```@meta
CurrentModule = TheNumberLine
```

# TheNumberLine

The **Number Line** is a common teaching tool in e.g. K-12 math classes accross the U.S.

_This package is in early development stage when breaking changes are to be expected._

**Authors:** Gael Forget and Jane Chapin

## Instructions

1. Download <https://github.com/gaelforget/TheNumberLine.jl>
2. Open a terminal window & enter `TheNumberLine.jl/` folder
3. Run `julia --project=./ src/run.jl`
4. Proceed as prompted in the terminal

_Tips:_

- the instructions prompted in the terminal will let you use `TheNumberLine` in your web browser as a [Pluto notebook](https://github.com/fonsp/Pluto.jl) called `notebook1.jl`
- you will also need, but only once as a pre-requisite, to download [Julia itself](https://docs.julialang.org/en/v1/) and then add `TheNumberLine` and `Pluto` to your julia environment
- to close the program, at the end once your are done using `TheNumberLine`, don't forget to go back to the terminal window and `Press Ctrl+C`

## Use Example

Once you are looking at `notebook1.jl` via `Pluto` in your web-browser, type a number of your choice in the text box and hit `add to number line`. Repeat a few times, e.g. with other numbers, to obtain something like this:

[![add](https://github.com/gaelforget/TheNumberLine.jl/raw/master/docs/png/add.png)]()

To go back to the starting point, hit `reset the number line` and you should now see:

[![reset](https://github.com/gaelforget/TheNumberLine.jl/raw/master/docs/png/reset.png)]()

## Main Functions

```@docs
NumberLinePlot
NumberLineExpression
```

## Customization

In the `notebook1` first code cell , simply replace the `text box` input widget

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

