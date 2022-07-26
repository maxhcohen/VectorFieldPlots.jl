# Import packages
using Plots
using LaTeXStrings
using VectorFieldPlots

# Plot defaults so things look nice
default(grid=false, framestyle=:box, label="", fontfamily="Computer Modern")

# Parameters of Van der Pol oscillator
μ = 1.0

# Define vector field
f(x, y) = [y, μ*(1 - x^2)*y - x]

# Region to plot over
xs = -5.0:0.5:5.0
ys = -5.0:0.5:5.0

# Plot the vector field
fig = plot_vector_field(xs, ys, f, scale=0.35)
xlabel!(L"x")
ylabel!(L"y")
display(fig)