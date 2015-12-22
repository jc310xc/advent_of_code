input = ARGV.first

count = 0

while count < 40
	digit = input[0]
	digitCount = 0
	newStr = ""
	while input.length > 0
		
		if(input[0] == digit)
			digitCount += 1
		else
			newStr += digitCount.to_s + digit.to_s
			digitCount = 1
			digit = input[0]
		end

		input = input.slice(1..-1)
	end
	newStr += digitCount.to_s + digit.to_s
	count += 1
	input = newStr
end

puts input.length