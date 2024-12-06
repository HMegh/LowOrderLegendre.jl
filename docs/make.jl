using LowOrderLegendre
using Documenter

DocMeta.setdocmeta!(LowOrderLegendre, :DocTestSetup, :(using LowOrderLegendre); recursive=true)

makedocs(;
    modules=[LowOrderLegendre],
    authors="Haroun Meghaichi <haroun.meghaichi@gmail.com> and contributors",
    sitename="LowOrderLegendre.jl",
    format=Documenter.HTML(;
        canonical="https://HMegh.github.io/LowOrderLegendre.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/HMegh/LowOrderLegendre.jl",
    devbranch="main",
)
