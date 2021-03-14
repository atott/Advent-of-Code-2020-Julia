data_in() = readlines("../Data/day5.txt")

function binary_seat(data)
   id(s) = parse(Int,map(x -> x ∈ ('B','R') ? '1' : '0', s),base=2)
   [id(s) for s in data]
end


function find_seat(data)
    t = sort(binary_seat(data))
    for i in 1:length(t)-1
        if t[i+1] != t[i]+1
            return(t[i]+1)
        end
    end
end


println("Part1: ", maximum(binary_seat(data_in())))

println("Part2: ", find_seat(data_in()))
