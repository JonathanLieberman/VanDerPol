# VanDerPol
Practicing solving ODEs and plotting in Julia

# Quickstart
1. Install packages `DifferentialEquations`, `Plots`, and `LaTeXStrings`
2. Run `VanDerPol.jl` in Julia

# Background
This is my first project in Julia. Julia recently hit 1.0 this year, which means hopefully things won't break moving forward!

Julia is a very fast language with a great suite of tools available for solving differential equations. I decided to get experience with Julia toolbox by building phase plots of VanDerPol oscillators with different parameters.

VanDerPol oscillators are interesting because their derivatives change orders of magnitude very quickly when they reach activation making the problem "stiff." Stiff problems often require adaptive timesteps to reach adequate solutions in a decent amount of time.

Julia makes this issue trivial by allow the user to pass the argument `alg_hints = [:stiff]` into the `solve` function, and the backend does all the work to pick a good solver.

This code was an exercise for me to get exposure to a new language and set of tools. Feel free to use this code for your own education or adapt it to your needs.
