
using DelimitedFiles

nums = readdlm("../Data/day1.txt",Int)


function find_multi(nums)
    for i in 1:length(nums)
        for j in nums
	    if nums[i] + j == 2020
	        return(nums[i]*j)
	    end
        end
    end
end


function find_multi2(nums)
    for i in 1:length(nums)
        for j in nums
	    for x in nums
	    	if nums[i] +j+x == 2020
	          return(nums[i]*j*x)
		end
	    end
        end
    end
end



println( "Part1: ",find_multi(nums)) 
println("Part2: ", find_multi2(nums)) 
