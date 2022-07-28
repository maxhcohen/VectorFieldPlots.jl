# VectorFieldPlots.jl
A simple package for plotting vector fields and phase portraits in Julia. The main utilities of this package are provided by the functions `plot_vector_field` and `plot_phase_portrait`, which take as inputs a list of `x` and `y` coordinates specifying the region to plot over, and a function `f(x, y)` that describes the vector field. 

## Installation
To download this package open up the Julia REPL, enter the package manager (type `]` into the REPL) and type

    add https://github.com/maxhcohen/VectorFieldPlots.jl.git

## Example usage
The following code shows how to use this package to plot the vector field and phase portrait for the Van der Pol oscillator.

```julia
using Plots
using LaTeXStrings
using VectorFieldPlots

# Plot defaults so things look nice
default(grid=false, framestyle=:box, label="", fontfamily="Computer Modern")

# Parameters of Van der Pol oscillator
μ = 1.0

# Define vector field
f(x, y) = [y, μ*(1 - x^2)*y - x]

# Region to plot vector field over
xs = -5.0:0.5:5.0
ys = -5.0:0.5:5.0

# Coordinates for initial conditions of phase portraits and length of corresponding sim
xs_phase = -3.0:0.5:3.0
ys_phase = -3.0:0.5:3.0
T = 10.0

# Plot the vector field
fig = plot_vector_field(xs, ys, f, scale=0.35)
plot_phase_portrait!(xs_phase, ys_phase, f, T)
xlabel!(L"x")
ylabel!(L"y")
title!("Van der Pol oscillator")
xlims!(-5, 5)
display(fig)

```

The above code produces the following image:

![](https://github.com/maxhcohen/VectorFieldPlots.jl/blob/main/images/van_der_pol.png)

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