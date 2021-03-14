
data_in() =  permutedims(reduce(hcat,[collect.(readlines("../Data/day3.txt"))...]))

function tree_count(trees, slope)
    n = cld(size(trees,1), slope.y)
    rs = range(1, step=slope.y, length=n)
    cs = range(1, step=slope.x, length=n)
    cs = map(c -> mod1(c, size(trees, 2)), cs)
    idxs = CartesianIndex.(rs, cs)
    count(==('#'), trees[idxs])
end

println("Part1: ", tree_count(data_in(), (x=3,y=1)) ) 

println("Part2: ", prod( tree_count.(Ref(data_in()), [(x=1,y=1),(x=3,y=1),(x=5,y=1),(x=7,y=1),(x=1,y=2)]) ) )
