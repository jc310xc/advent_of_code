def wrapped_char(str)
  match = str.match(/([a-z]).\1/)
  
  !match.nil?
end

def repetitive(str)
  match = str.match(/([a-z]{2}).*\1/)
  
  !match.nil?
end

filename = ARGV.first
file = open(filename)
words = file.readlines

numNice = 0

words.each { |str|
  if(wrapped_char(str) & repetitive(str))
    numNice += 1
  end
}

puts numNice