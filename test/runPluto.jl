
#julia --project=./ test/runPluto.jl

using TheNumberLine, Pluto
p=dirname(pathof(TheNumberLine))
cd(p)

println("\n Hi There \n")
println("Let's open the Number Line notebook using Pluto.jl")
println("Hit any key to start; then open `src/standard_number_line.jl`\n")
readline();

#Base.run(`open http://localhost:1234`)
Pluto.run()

