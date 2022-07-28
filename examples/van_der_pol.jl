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

# Save figure
savefig(fig, "van_der_pol.png")