filename = ARGV.first
file = open(filename)

string = file.read

without_whitespace = string.delete("\n")

wwCount = without_whitespace.length

backslashCount = string.scan(/\\\\/).count
string = string.gsub(/\\\\/, "")

hexcodeCount = string.scan(/\\x[a-f0-9]{2}/).count
string = string.gsub(/\\x[a-f0-9]{2}/,"")

escapedQuoteCount = string.scan(/\\"/).count
string = string.gsub(/\\"/,"")

string = string.gsub(/"/,"")

string = string.delete!("\n")

totalCount = backslashCount + string.length + hexcodeCount + escapedQuoteCount

puts string
puts "Escaped Backslashes: " + backslashCount.to_s
puts "Escaped Hex Chars: " + hexcodeCount.to_s
puts "Escaped Quotes: " + escapedQuoteCount.to_s
puts "Leftover string length: " + string.length.to_s
puts "Total remaining Length: " + totalCount.to_s
puts "Total Without Whitespace: " + wwCount.to_s

puts "Answer: " + (wwCount - totalCount).to_s