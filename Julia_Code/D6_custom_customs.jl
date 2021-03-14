
data_in() = split.(collect(split(read("../Data/day6.txt",String),"\n\n")))

function find_cup(data)
   sum([length(unique(join(data[i])))  for i in 1:length(data)])
end

function find_cap(data)
    sum([length(∩(Set.(data[i])...))  for i in 1:length(data)])
end



println("Part1: ", find_cup(data_in()) )

println("Part2: ", find_cap(data_in()) ) 
