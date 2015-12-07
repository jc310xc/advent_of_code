def three_vowels(str)
  str.count("aeiou") >= 3
end

def consecutive_characters(str)
  prev_char = ""
  ans = false
  str.each_char { |c|
    if(c == prev_char)
	  ans = true
	  break
	end
	
	prev_char = c
  }
  
  ans
end

def valid_str(str)
  str.index("ab").nil? & str.index("cd").nil? & str.index("pq").nil? & str.index("xy").nil?
end

filename = ARGV.first

file = open(filename)

txt = file.readlines

numNice = 0

txt.each{ |str|
  if(three_vowels(str) & consecutive_characters(str) & valid_str(str))
    numNice += 1
  end  
}

puts numNice