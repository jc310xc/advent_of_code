def isValid(str)

end

def threeConsec(str)
	input = str[1..-1]
	char = str[0]
	consec = 1

	while(input.length > 0)
		if(input[0] == char.succ)
			char = char.next
			consec += 1
		else
			char = input[0]
			consec = 1
		end
		return true if consec == 3
		input = input[1..-1]
	end
	return false
end

def validChars(str)
	str.index(/[iol]/) == nil
end

def twoPairs(str)
	
end

input = ARGV.first

puts validChars(input)