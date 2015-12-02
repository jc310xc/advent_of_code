filename = ARGV.first

filecontents = open(filename)

txt = filecontents.read

open = txt.count('(')
close = txt.count(')')
diff = open - close

puts "Number of open parens: " + open.to_s
puts "Number of close parens: " + close.to_s
puts "Santa is on floor: " +  diff.to_s