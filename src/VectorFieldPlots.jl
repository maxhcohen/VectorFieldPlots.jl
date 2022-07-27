module VectorFieldPlots

# Include required packages
using LinearAlgebra
using Plots

# Export functions
export plot_vector_field
export plot_vector_field!
export mesh_vector_field 
export meshgrid

# Include source code
include("meshgrid.jl")
include("vector_field_colors.jl")
include("plot_vector_field.jl")

end
