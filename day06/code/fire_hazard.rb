def parse_command(str)
  if(str.include? "turn on")
    1
  elsif(str.include? "turn off")
    2
  else
    3
  end
end

def get_coords(str)
  str.scan((/(\d+)/)).to_a.flat_map{|x| x}
end

def turn_on(arr, startX, startY, endX, endY)
  i = startX
  j = startY
  while(i <= endX) do
    while(j <= endY) do
	  arr[i][j] = 1
	  j += 1
	end
    j = startY
	i += 1
  end
  
  arr
end

def turn_off(arr, startX, startY, endX, endY)
  i = startX
  j = startY
  while(i <= endX) do
    while(j <= endY) do
	  arr[i][j] = 0
	  j += 1
	end
    j = startY
	i += 1
  end
  
  arr
end

def toggle(arr, startX, startY, endX, endY)
  i = startX
  j = startY
  while(i <= endX) do
    while(j <= endY) do
	  if(arr[i][j] == 1)
		arr[i][j] = 0
	  else
		arr[i][j] = 1
	  end
	  j += 1
	end
    j = startY
	i += 1
  end
  
  arr
end

filename = ARGV.first
file = open(filename)
instructions = file.readlines
  
lights = Array.new(1000) { Array.new(1000,0)}

instructions.each{|line|
  command = parse_command(line)
  coords = get_coords(line)
  
  if(command == 1)
    lights = turn_on(lights, coords[0].to_i, coords[1].to_i, coords[2].to_i, coords[3].to_i)
  elsif(command == 2)
    lights = turn_off(lights, coords[0].to_i, coords[1].to_i, coords[2].to_i, coords[3].to_i)
  else
    lights = toggle(lights, coords[0].to_i, coords[1].to_i, coords[2].to_i, coords[3].to_i)
  end
}

puts lights.flatten.count(1)