# Import packages
using Revise
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

# Region to plot vector field over
xs = LinRange(-2*π, 2*π, 30)
ys = LinRange(-2*π, 2*π, 30)

# Region to plot phase over
xs_phase = LinRange(-π, π, 4)
ys_phase = LinRange(-π, π, 4)

# Plot the vector field
fig = plot_vector_field(xs, ys, f, scale=0.2)
plot_phase_portrait!(xs_phase, ys_phase, f, 10.0)
xlabel!(L"x")
ylabel!(L"y")
xlims!(-π, π)
display(fig)