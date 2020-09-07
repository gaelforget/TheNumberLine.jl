```@meta
CurrentModule = TheNumberLine
```

# TheNumberLine

_This package is in early development stage when breaking changes are to be expected._

```@index
```

**Authors:** Gael Forget and Jane Chapin

## Instructions

In a terminal window, start the `Julia` REPL and execute:

```
using TheNumberLine, Pluto
p=dirname(pathof(TheNumberLine))
cd(p)
Pluto.run()
```

As prompted by `Pluto.run()`, open `http://localhost:1234` in a web browser. Then in the newly opened web-page, under `Open from file:` enter `notebook1.jl` and click `open`. 

## The starting point:

[<img src="../png/reset.png" width="30%">]() 

Once can always recover this initial number line state by hitting `reset the number line`

## Sample Application:

Try entering a number of your choice in the text box and hit `add to number line`. 

Repeat a few times, e.g. with different numbers, to obtain something like this:

[<img src="../png/add.png" width="40%">]()


```@autodocs
Modules = [TheNumberLine]
```
