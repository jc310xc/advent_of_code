inputfile = ARGV.first
file = open(inputfile)

puts file.read.gsub(/[^-\d]+/, ' ').split.map(&:to_i).reduce(:+)
