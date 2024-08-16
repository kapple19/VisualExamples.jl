using VisualExamples
using Documenter

DocMeta.setdocmeta!(VisualExamples, :DocTestSetup, :(using VisualExamples); recursive=true)

makedocs(;
    modules=[VisualExamples],
    authors="Aaron Kaw <aaronjkaw@gmail.com> and contributors",
    sitename="VisualExamples.jl",
    format=Documenter.HTML(;
        canonical="https://kapple19.github.io/VisualExamples.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/kapple19/VisualExamples.jl",
    devbranch="main",
)
