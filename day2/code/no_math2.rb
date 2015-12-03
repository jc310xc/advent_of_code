filename = ARGV.first

dimensList = IO.readlines(filename, "\n")

total_length = 0

dimensList.each { |line|
	#sort to get the smallest two, which gives us the smallest circ.
	dimens = line.split("x").map { |i| i.to_i }.sort
	
	smallest_circ = 2 * (dimens[0] + dimens[1])
	
	volume = dimens.reduce(1, :*)
	
	total_length += smallest_circ + volume
}
	
puts total_length.to_s