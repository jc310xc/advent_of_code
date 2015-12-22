filename = ARGV.first
file = open(filename)

string = file.read

arrLength = string.split("\n").count
puts "Length: " + arrLength.to_s

backslashCount = string.scan(/\\/).count

quoteCount = string.scan(/"/).count

string = string.delete!("\n")

totalCount = backslashCount + string.length + quoteCount + arrLength * 2

puts string
puts "Backslashes: " + backslashCount.to_s
puts "Quotes: " + quoteCount.to_s
puts "string length: " + string.length.to_s

puts "Answer: " + (totalCount - string.length).to_s