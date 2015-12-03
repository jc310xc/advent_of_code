filename = ARGV.first

dimensList = IO.readlines(filename, "\n")

total_area = 0

dimensList.each { |line|
	#gross. couldn't think of a better way to do it though.
	dimens = line.split("x")
	
	l = dimens[0].to_i
	w = dimens[1].to_i
	h = dimens[2].to_i
	
	lw = l*w
	wh = w*h
	lh = l*h
	
	#Why? BECAUSE I CAN.
	smallest_area = (lw < wh) ? (lw < lh) ? lw : lh : (wh < lh) ? wh : lh 

	total_area += 2 * (lw + wh + lh) + smallest_area
}
	
puts total_area.to_s