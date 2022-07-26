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