using LightGraphs
using SimpleWeightedGraphs

readInput() = build_graph(split(strip(read("../Data/day7.txt", String)), '\n'))

function build_graph(data)
    edges = []
    for line in data
        outer_bag, inner_bags = split(line, " contain ")
        occursin("no other bags", inner_bags) && continue
        for bag in split(inner_bags, ", ")
            counter, name = parse(Int, first(bag)), strip(bag[3:end], '.')
            e = String(rstrip(outer_bag, 's')), String(rstrip(name, 's')), counter
            push!(edges, e)
        end
    end
    nodes = collect(Set(src for (src, _, _) in edges) ∪ Set(dst for (_, dst, _) in edges))
    mapping = Dict(n => i for (i,n) in enumerate(nodes))
    g = SimpleWeightedDiGraph(length(nodes))
    for (src, dst, counter) in edges
        add_edge!(g, mapping[src], mapping[dst], counter)
    end
    g, mapping, nodes
end


part1(data = readInput()) = part1(data[1], data[2])
part1(g, mapping) = count(!=(0), bfs_parents(g, mapping["shiny gold bag"], dir = :in)) - 1

function total_bags(g, v)
    isempty(neighbors(g, v)) && return 1
    1 + sum(neighbors(g, v)) do nb
        Int(g.weights[nb, v]) * total_bags(g, nb)
    end
end

part2(data = readInput()) = part2(data[1], data[2])
part2(g, mapping) = total_bags(g, mapping["shiny gold bag"]) - 1

println("Part1: ", part1())
println("Part2: ", part2())
