

#julia --project=./ src/run.jl

using TheNumberLine, Pluto
p=dirname(pathof(TheNumberLine))
cd(p)

println("\n Hi There \n")
println("Let's open TheNumberLine @ http://localhost:1234")
println("You may need to reload the page in your web browser")
println("Then open e.g. notebook1.jl using Pluto.jl")
println("Hit any key to start\n")
readline();

Base.run(`open http://localhost:1234`)
Pluto.run()

