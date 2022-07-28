"""
    plot_phase_portrait(xs, ys, f::Function, T::Float64; lw=1)
"""
function plot_phase_portrait(xs, ys, f::Function, T::Float64; lw=1)
    # Make meshgrid from (xs, ys)
    Xs, Ys = meshgrid(xs, ys)

    # Construct vector of initial conditions from meshgrid
    X0 = [[x, y] for (x, y) in zip(Xs, Ys)]

    # Simulate vector field from time 0 to T from each initial condition
    X = [simulate(f, x0, T) for x0 in X0]

    # Plot each trajectory on the (x, y) plane
    fig = plot()
    for x in X
        plot!(x, vars=(1,2), label="", lw=lw)
    end

    return fig
end

"""
    plot_phase_portrait!(xs, ys, f::Function, T::Float64; lw=1)
"""
function plot_phase_portrait!(xs, ys, f::Function, T::Float64; lw=1)
    # Make meshgrid from (xs, ys)
    Xs, Ys = meshgrid(xs, ys)

    # Construct vector of initial conditions from meshgrid
    X0 = [[x, y] for (x, y) in zip(Xs, Ys)]

    # Simulate vector field from time 0 to T from each initial condition
    X = [simulate(f, x0, T) for x0 in X0]

    # Plot each trajectory on the (x, y) plane
    fig = Plots.current()
    for x in X
        plot!(x, vars=(1,2), label="", lw=lw)
    end

    return fig
end

"""
    simulate(f::Function, x, T::Float64)

Simulate the differential equation `ẋ = f(x)` from initial condition `x` over `[0,T]`
"""
function simulate(f::Function, x, T::Float64)
    rhs(x, p, t) = f(x[1], x[2])
    problem = ODEProblem(rhs, x, [0.0, T])

    return solve(problem, Tsit5())
end