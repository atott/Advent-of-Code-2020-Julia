
data_in() = split(read("../Data/day4.txt", String), "\n\n")

fields = ["byr:","iyr:","eyr:","hgt:","hcl:","ecl:","pid:"]

function pass_ver(passports, fields) 
    valid = [occursin.(fields, i) for i in eachrow(passports)]
    sum(all.(i -> i==1, valid))
end

fields2 = (
    r"byr:(19[2-9][0-9]|200[0-2])\b",
    r"iyr:20(1[0-9]|20)\b",
    r"eyr:20(2[0-9]|30)\b",
    r"hgt:(1([5-8][0-9]|9[0-3])cm|(59|6[0-9]|7[0-6])in)\b",
    r"hcl:#[0-9a-f]{6}\b",
    r"ecl:(amb|blu|brn|gry|grn|hzl|oth)\b",
    r"pid:\d{9}\b"
)



println("Part1: ", pass_ver(data_in(),fields))

println("Part2: ", pass_ver(data_in(), fields2))
