using Documenter, TheNumberLine, PlutoSliderServer

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
    warnonly = [:cross_references,:missing_docs],
    pages=[
        "Home" => "index.md",
        "Docs" => "functions.md",
    ],
)

lst=("standard_number_line.jl",)
for i in lst
    fil_in=joinpath(@__DIR__,"..", "src",i)
    fil_out=joinpath(@__DIR__,"build", i[1:end-2]*"html")
    PlutoSliderServer.export_notebook(fil_in)
    mv(fil_in[1:end-2]*"html",fil_out)
    cp(fil_in,fil_out[1:end-4]*"jl")
end

fil_in=joinpath(tempdir(),"tmp.svg")
fil_out=joinpath(@__DIR__,"build","tmp.svg")
isfile(fil_in) ? mv(fil_in,fil_out) : nothing

deploydocs(;
    repo="github.com/gaelforget/TheNumberLine.jl",
)
