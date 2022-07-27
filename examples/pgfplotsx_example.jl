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
        height = "4.5in",
        width = "4.5in",
        xmin = -1.0,
        xmax = 1.0,
        ymin = -1.0,
        ymax = 1.0,
        "colormap/viridis",
        colorbar,
        label_style={font="\\Large"},
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

# Show the figure
display(fig)

# Save figure to .tex document and to png
pgfsave("vector_field.tex", fig)
pgfsave("vector_field.png", fig, dpi=300)

