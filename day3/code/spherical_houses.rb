filename = ARGV.first

file = open(filename)

chars = file.read.split("")

position = Array.new

x_curr = 0
y_curr = 0

index = 0

chars.each{|k|

  position[index] = x_curr.to_s + ", " + y_curr.to_s

  if(k == "^")
    y_curr += 1
  elsif(k == "v")
    y_curr -= 1
  elsif(k == "<")
    x_curr -= 1
  else
    x_curr += 1
  end
  
  index += 1
}

puts position.uniq.count