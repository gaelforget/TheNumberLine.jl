# TheNumberLine

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://gaelforget.github.io/TheNumberLine.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://gaelforget.github.io/TheNumberLine.jl/dev)
[![Build Status](https://travis-ci.org/gaelforget/TheNumberLine.jl.svg?branch=master)](https://travis-ci.org/gaelforget/TheNumberLine.jl)
[![Coverage](https://codecov.io/gh/gaelforget/TheNumberLine.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gaelforget/TheNumberLine.jl)
[![Coverage](https://coveralls.io/repos/github/gaelforget/TheNumberLine.jl/badge.svg?branch=master)](https://coveralls.io/github/gaelforget/TheNumberLine.jl?branch=master)

_This package is in early development stage when breaking changes are to be expected._

**Authors:** Gael Forget and Jane Chapin

## Instructions

In a terminal window, start the `Julia` REPL and, after installing needed packages, execute:

```
using TheNumberLine, Pluto
p=dirname(pathof(TheNumberLine))
cd(p)
Pluto.run()
```

As prompted by `Pluto.run()`, open e.g. `http://localhost:1234` in a web browser. In the newly opened page, type `notebook1.jl` next to `Open from file:`, and hit `open`. 

## Use Example:

In the so-opened `notebook1.jl`, type a number of your choice in the text box and hit `add to number line`. Repeat a few times, e.g. with other numbers, to obtain something like this:

[<img src="docs/png/add.png" width="40%">]()

## Starting Point:

One can always hit `reset the number line` to recover the original state of the number line:

[<img src="docs/png/reset.png" width="30%">]() 



