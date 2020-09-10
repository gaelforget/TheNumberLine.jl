# TheNumberLine

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://gaelforget.github.io/TheNumberLine.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://gaelforget.github.io/TheNumberLine.jl/dev)
[![Build Status](https://travis-ci.org/gaelforget/TheNumberLine.jl.svg?branch=master)](https://travis-ci.org/gaelforget/TheNumberLine.jl)
[![Coverage](https://codecov.io/gh/gaelforget/TheNumberLine.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gaelforget/TheNumberLine.jl)
[![Coverage](https://coveralls.io/repos/github/gaelforget/TheNumberLine.jl/badge.svg?branch=master)](https://coveralls.io/github/gaelforget/TheNumberLine.jl?branch=master)

The **Number Line** is a common teaching tool in e.g. K-12 math classes accross the U.S.

_This package is in early development stage when breaking changes are to be expected._

**Authors:** Gael Forget and Jane Chapin

[![DOI](https://zenodo.org/badge/293410387.svg)](https://zenodo.org/badge/latestdoi/293410387)

## Instructions

1. Download <https://github.com/gaelforget/TheNumberLine.jl>
2. Open a terminal window & enter the `TheNumberLine.jl/` folder
3. Run `julia --project=./ src/run.jl`
4. Proceed as prompted in the terminal to open `notebook1.jl` via `Pluto.jl`

_Tips:_

- as prompted in the terminal you will use `TheNumberLine.jl` in your web browser via the [Pluto notebook](https://github.com/fonsp/Pluto.jl) interface
- first time using `TheNumberLine.jl`? you may need, but only once as a pre-requisite, to download [Julia itself](https://docs.julialang.org/en/v1/) and then add `TheNumberLine.jl` and `Pluto.jl` via the [package manager](https://docs.julialang.org/en/v1/stdlib/Pkg/)
- to close the program / close `TheNumberLine.jl` off, you want to go back to the terminal window and `Press Ctrl+C`

## Use Example:

Once you are looking at `notebook1.jl` via `Pluto.jl` in your web-browser, type a number of your choice in the text box and hit `add to number line`. Repeat a few times, e.g. with other numbers, to obtain something like the graph shown on the right hand side. To go back to the starting point, hit `reset the number line` (left hand sode graph).

<img src="docs/png/reset.png" width="40%">  <img src="docs/png/add.png" width="40%">




