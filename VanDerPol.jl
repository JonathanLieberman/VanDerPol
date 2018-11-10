# Load Libraries
using DifferentialEquations
using Plots
using Plots
using LaTeXStrings

# Solve VanDerPol Oscillator for a given mu
VDP = function(mu)
    u0 = [-2.0, 0.0]
    tspan = (0.0,10^(log10(mu) + 1))
    m = [mu]
    g = function(du,u,p,t)
        du[1] = u[2]
        du[2] = p[1]*(1-u[1].^2).*u[2] - u[1]
    end
    prob = ODEProblem(g, u0, tspan, m)
    sol = solve(prob, alg_hints = [:stiff], reltol = 1e-8, abstol = 1e-8)
end

# Map levels of mu to solution objects
mus = [100,200,500,1000]
sols=map(VDP, mus)

# Create the full plot
fullPlot = plot()
for i = 1:length(sols)
    sol = sols[i]
    mu = mus[i]
    plot!(fullPlot, sol[1,:], sol[2,:], label = "mu = $mu")
end

# Finish the full plot
pyplot()
title!("Phase Plots of VanDerPol Oscillators")
xaxis!("Voltage")
yaxis!(L"\frac{dVoltage}{dt}")

# Deepcopy the plot to zoom in
closePlot = deepcopy(fullPlot)
plot!(fullPlot, legend = false) # legend is too hard to see on full plot
plot!(closePlot, xlim = [-2,0], ylim = [0,1], legend = true)
title!(closePlot, "Close Up of VanDerPol Phase Plot")

# Display the plots stacked
plot(fullPlot, closePlot, layout=(2,1))
