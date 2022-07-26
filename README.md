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
