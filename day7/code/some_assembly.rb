def evalLHS(lhs, vals)
  tokens = lhs.split(" ")
  
  if(tokens.length == 1)
    # just return the val
  puts "returning value " + tokens[0]
	
  id = getIdentifier(tokens[0], vals)

  id.to_i
  elsif(tokens.length == 2)
    # Reduce a NOT
  val = vals[tokens[1]]
  if(val == nil)
    puts "nil"
    return nil
  else
    puts val
  end
  result = ~val.to_i
  puts "returning bitwise NOT of " + tokens[1] + ": " + result.to_s
	result
  else
    # We need to simplify further
    reduceStatement(tokens, vals)
  end
end

def getIdentifier(token, values)
  if(token == "1" || token == "0")
    token.to_i
  else
    values[token]
  end
end

def reduceStatement(tokens, values)
  operand1 = getIdentifier(tokens[0], values)
  puts "operand1: " + operand1.to_s
  #we dont need the lookup if the second token is a shift
  if(tokens[1] == "LSHIFT" || tokens[1] == "RSHIFT")
    operand2 = tokens[2]
  else
    operand2 = getIdentifier(tokens[2], values)
  end

  if(operand1 == nil || operand2 == nil)
    return nil
  end
  
  if(tokens[1] == "AND")
    result = operand1.to_i & operand2.to_i
    puts "returning " + operand1.to_s + " AND " + operand2.to_s + ": " + result.to_s
  elsif(tokens[1] == "OR")
    result = operand1.to_i | operand2.to_i
    puts "returning " + operand1.to_s + " OR " + operand2.to_s + ": " + result.to_s
  elsif(tokens[1] == "LSHIFT")
    result = operand1.to_i << operand2.to_i
    puts "returning " + operand1.to_s + " LSHIFT " + operand2.to_s + ": " + result.to_s
  elsif(tokens[1] == "RSHIFT")
    result = operand1.to_i >> operand2.to_i
    puts "returning " + operand1.to_s + " RSHIFT " + operand2.to_s + ": " + result.to_s
  end

  result
end

def printVals(vals)
  vals.each{|k,v|
    print k + ": "

    binNum = ""

    16.downto(0) do |n|  binNum += v[n].to_s end

    output = "0" + binNum[1..16]

    print output.to_i(2)

    print "\n"
  }
end

filename = ARGV.first
file = open(filename)

commands = file.readlines

vals = Hash.new
vals.default = nil

count = 1
input = ""

while commands.count > 0
  count = 1
  commands.delete_if{ |cmd| 
    puts "Evaluating command " + count.to_s + " of " + commands.count.to_s
    puts "command: " + cmd
    sides = cmd.split(" -> ")
    
    lhs = sides[0]
    rhs = sides[1]
    
    rhs = rhs.tr("\n","")

    res = evalLHS(lhs, vals)
    #puts res.to_s + " returned"
    #puts "storing " + res.to_s + " into " + rhs
    if(res == nil)
      false
    else
      vals[rhs] = res
      count += 1
      true
    end
  }
end

printVals(vals)