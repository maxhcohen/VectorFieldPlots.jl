# Import packages
using Plots
using LaTeXStrings
using VectorFieldPlots

# Plot defaults so things look nice
default(grid=false, framestyle=:box, label="", fontfamily="Computer Modern")

# Parameters of pendulum
m = 1.0
l = 1.0
b = 0.4
g = 9.8

# Define vector field
f(q, q̇) = [q̇, -(1/(m*l^2)) * (b*q̇ + m*g*l*sin(q))]

# Region to plot over
xs = LinRange(-π, π, 20)
ys = LinRange(-π, π, 20)

# Plot the vector field
fig = plot_vector_field(xs, ys, f, scale=0.2)
xlabel!(L"x")
ylabel!(L"y")
display(fig)