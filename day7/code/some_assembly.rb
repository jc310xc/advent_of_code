def evalLHS(lhs, vals)
  tokens = lhs.split(" ")
  
  if(tokens.length == 1)
    # just return the val
	tokens[0].to_i
  elsif(tokens.length == 2)
    # Reduce a NOT
	[~vals[tokens[1]].to_i].pack("n")
  else
    # We need to simplify further
    reduceStatement(tokens, vals)
  end
end

def getIdentifier(token, values)
  return values[token]
end

def reduceStatement(tokens, values)
  operand1 = getIdentifier(tokens[0], values)
  
  #we dont need the lookup if the second token is a shift
  if(tokens[1] == "LSHIFT" || tokens[1] == "RSHIFT")
    operand2 = tokens[2]
  else
    operand2 = getIdentifier(tokens[2], values)
  end
  
  if(tokens[1] == "AND")
    [operand1.to_i & operand2.to_i].pack("n")
  elsif(tokens[1] == "OR")
    [operand1.to_i | operand2.to_i].pack("n")
  elsif(tokens[1] == "LSHIFT")
    [operand1.to_i << operand2.to_i].pack("n")
  elsif(tokens[1] == "RSHIFT")
    [operand1.to_i >> operand2.to_i].pack("n")
  end
end

def printVals(vals)
  vals.each{|k,v|
    puts k + ": " + v.to_s
  }
end

filename = ARGV.first
file = open(filename)

commands = file.readlines

vals = Hash.new
vals.default = [0].pack("n")

commands.each{ |cmd| 
  sides = cmd.split(" -> ")
  
  lhs = sides[0]
  rhs = sides[1]
  
  rhs = rhs.tr("\n","")
  
  vals[rhs] = evalLHS(lhs, vals)
}

printVals(vals)