filename = ARGV.first

filecontents = open(filename)

txt = filecontents.read

chars = txt.split("")

currFloor = 0
ans = 0

#This is massively inefficient.
chars.each do |v,k|
  if(v == ")")
    currFloor -= 1
  elsif (v == "(")
    currFloor += 1
  end
  
  ans += 1
  
  break if currFloor == -1
end

puts ans