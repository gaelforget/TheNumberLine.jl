using TheNumberLine
using Documenter

makedocs(;
    modules=[TheNumberLine],
    authors="Gael Forget <gforget@mit.edu> and Jane Chapin <janemchapin@gmail.com>",
    repo="https://github.com/gaelforget/TheNumberLine.jl/blob/{commit}{path}#L{line}",
    sitename="TheNumberLine.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gaelforget.github.io/TheNumberLine.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gaelforget/TheNumberLine.jl",
)
