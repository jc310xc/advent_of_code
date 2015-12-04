filename = ARGV.first

file = open(filename)

chars = file.read.split("")

santa_position = ["0, 0"]
robo_position = Array.new

santa_x_curr = 0
santa_y_curr = 0

robo_x_curr = 0
robo_y_curr = 0

index = 0

chars.each{|k|
  
  if(index % 2 == 0)
    if(k == "^")
	  robo_y_curr += 1
    elsif(k == "v")
	  robo_y_curr -= 1
    elsif(k == "<")
	  robo_x_curr -= 1
    else
	  robo_x_curr += 1
    end
  
	robo_position[index] = robo_x_curr.to_s + ", " + robo_y_curr.to_s
  else
    if(k == "^")
	  santa_y_curr += 1
    elsif(k == "v")
	  santa_y_curr -= 1
    elsif(k == "<")
	  santa_x_curr -= 1
    else
	  santa_x_curr += 1
    end
	
	santa_position[index] = santa_x_curr.to_s + ", "+ santa_y_curr.to_s
  end
  
  index += 1
}

final_arr = (santa_position.reject{|e| e.to_s.empty?} << robo_position.reject{|e| e.to_s.empty?}).flatten!

puts final_arr.uniq.count