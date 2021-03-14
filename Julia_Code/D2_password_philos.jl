using DelimitedFiles

pass = readdlm("../Data/day2.txt")


function clean_pass(pass)
    pass[1:end ,2] = chop.(pass[1:end,2])
    pass[1:end,1]  = split.(pass[1:end,1], "-")
    pass[1:end,1] = [parse.(Int,x) for x in pass[1:end,1]]
return(pass)
end

pass = clean_pass(pass)


pass = hcat(pass,count.(pass[1:end,2], pass[1:end,3]))

println("Part1: ",sum([pass[i,1][1] <= pass[i,4] <= pass[i,1][2] for i = 1:size(pass,1)]))

println("Part2: ", sum( [ count([string(pass[i,3][pass[i,1][1]]) == pass[i,2], string(pass[i,3][pass[i,1][2]]) == pass[i,2] ])==1  for i = 1:size(pass,1) ] ))



