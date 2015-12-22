def getLocation(num)
	if(num == 0)
		"Faerun"
	elsif(num == 1)
		"Tristram"
	elsif(num == 2)
		"Tambi"
	elsif(num == 3)
		"Norrath"
	elsif(num == 4)
		"Snowdin"
	elsif(num == 5)
		"Straylight"
	elsif(num == 6)
		"AlphaCentauri"
	elsif(num == 7)
		"Arbre"
	else
		"undefined"
	end
end

matrix = [[0, 65, 129, 144, 71, 137, 3, 149],
		  [65, 0, 63, 4, 105, 125, 55, 14],
		  [129, 63, 0, 68, 52, 65, 22, 143],
		  [144, 4, 68, 0, 8, 23, 136, 115],
		  [71, 105, 52, 8, 0, 101, 84, 96],
		  [137, 125, 65, 23, 101, 0, 107, 14],
		  [3, 55, 22, 136, 84, 107, 0, 46],
		  [149, 14, 143, 115, 96, 14, 46, 0]]

locations = [1, 2, 3, 4, 5, 6, 7, 8]

maxLength = Float::INFINITY * -1

locations.permutation{|arr|
	length = 0
	idx = 0

	while(idx < arr.length - 1)
		currLocation = arr[idx] - 1
		nextLocation = arr[idx+1] - 1

		length += matrix[currLocation][nextLocation]
		idx += 1
	end
	if length > maxLength
		maxLength = length
	end
}

puts maxLength