# VectorFieldPlots.jl
A simple package for plotting vector fields in Julia.

## Installation
To download this package open up the Julia REPL, enter the package manager (type `]` into the REPL) and type

    add https://github.com/maxhcohen/VectorFieldPlots.jl.git

## Example usage
The following code provides a simple use case of this package.

```julia
# Import packages
using Plots
using LaTeXStrings
using VectorFieldPlots

# Plot defaults so things look nice
default(grid=false, framestyle=:box, label="", fontfamily="Computer Modern")

# Define vector field
f(x, y) = [-y, x]

# Region to plot over
xs = -1.0:0.1:1.0
ys = -1.0:0.1:1.0

# Plot the vector field
fig = plot_vector_field(xs, ys, f, scale=0.1)
xlabel!(L"x")
ylabel!(L"y")
xlims!(-1, 1)
ylims!(-1, 1)
display(fig)

```

The output of the above code produces something like this:

![](https://github.com/maxhcohen/VectorFieldPlots.jl/blob/main/images/example.png)

By default, the length of each vector is normalized and then scaled according to the keyword argument `scale` so that the plot isn't cluttered. The magnitude of each vector is indicated by the `colormap` keyword argument which defaults to `:viridis`. 

## Example with [PGFPlotsX.jl](https://github.com/KristofferC/PGFPlotsX.jl)
It is also possible to use the internal functions from `VectorFieldPlots.jl` to quickly plot a vector field using [PGFPlotsX.jl](https://github.com/KristofferC/PGFPlotsX.jl), which can then be easily included in a LaTeX document. The following code shows an example of this.

```julia
using PGFPlotsX
using LaTeXStrings
using LinearAlgebra
using VectorFieldPlots

# Define vector field
f(x, y) = [-y, x]

# Region to plot over
xs = -1.0:0.1:1.0
ys = -1.0:0.1:1.0
Xs, Ys = meshgrid(xs, ys)

# Compute vector field over meshgrid
scale = 0.075
normalize_arrows = true
dx, dy = mesh_vector_field(Xs, Ys, f, scale, normalize_arrows)

# Map magnitude to colors
c = norm.(f.(Xs, Ys))

# Make PGF Plot
fig = @pgf Axis(
    {   
        xlabel = L"x",
        ylabel = L"y",
        xmin = -1.0,
        "colormap/viridis",
        colorbar,
    },
    Plot(
        {
            quiver = {u = "\\thisrow{u}", v = "\\thisrow{v}"},
            "-stealth",
            point_meta="\\thisrow{C}",
            "quiver/colored",
        },
        Table({meta="C"},
            x=Xs, y=Ys, u=dx, v=dy, C=c),
    ),
)

# Save to .tex document
pgfsave("vector_field.tex", fig)
```

This produces the following output

![](https://github.com/maxhcohen/VectorFieldPlots.jl/blob/main/images/vector_field.png)