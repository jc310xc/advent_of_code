def getLocation(num)
	if(num == 0)
		"Alice"
	elsif(num == 1)
		"Bob"
	elsif(num == 2)
		"Carol"
	elsif(num == 3)
		"David"
	elsif(num == 4)
		"Eric"
	elsif(num == 5)
		"Frank"
	elsif(num == 6)
		"George"
	elsif(num == 7)
		"Mallory"
	elsif(num == 8)
		"Self"
	else
		"undefined"
	end
end

matrix = [[0, -57, -62, -75, 71, -22, -23, -76, 0],
		  [-14, 0, 48, 89, 86, -2, 27, 19, 0],
		  [37, 45, 0, 24, 5, -68, -25, 30, 0],
		  [-51, 34, 99, 0, 91, -38, 60, -63, 0],
		  [23, -69, -33, -47, 0, 75, 82, 13, 0],
		  [77, 27, -87, 74, -41, 0, 99, 26, 0],
		  [-63, -51, -60, 30, -100, -63, 0, 57, 0],
		  [-71, -28, -10, 44, 22, 79, 16, 0, 0],
		  [0, 0, 0, 0, 0, 0, 0, 0, 0]]

people = (0..8).to_a
maxHappiness = Float::INFINITY * -1

the_arr = nil

permutations = people.permutation{|arr|
	happiness = 0
	idx = 0

	while(idx < arr.length)
		currPerson = arr[idx]
		leftPerson = idx == 0 ? arr[arr.length-1] : arr[idx - 1]
		rightPerson = idx == arr.length - 1 ? arr[0] : arr[idx + 1]

		happiness += matrix[currPerson][leftPerson]
		happiness += matrix[currPerson][rightPerson]
		idx += 1
	end
	if happiness > maxHappiness
		maxHappiness = happiness
		the_arr = arr
	end
}

puts the_arr.map{|el| getLocation(el)}.join(", ")

puts maxHappiness