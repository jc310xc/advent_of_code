require "digest/md5"

input = ARGV.first

hashed_str = "12345"
i = 0

while(hashed_str[0,5] != "00000")
  if(hashed_str[0,3] == "000")
    puts i.to_s + ": " + hashed_str
  end
  hashed_str = Digest::MD5.hexdigest(input + i.to_s)
  i += 1
end

puts hashed_str
puts i