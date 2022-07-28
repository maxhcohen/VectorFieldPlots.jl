module VectorFieldPlots

# Include required packages
using LinearAlgebra
using Plots
using OrdinaryDiffEq

# Export functions
export plot_vector_field
export plot_vector_field!
export mesh_vector_field 
export meshgrid
export plot_phase_portrait
export plot_phase_portrait!

# Include source code
include("meshgrid.jl")
include("vector_field_colors.jl")
include("plot_vector_field.jl")
include("plot_phase_portrait.jl")

end
