reindeer = [{ name: "Rudolph", velocity: 22, spurt: 8, restDuration: 165, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Cupid", velocity: 8, spurt: 17, restDuration: 114, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Prancer", velocity: 18, spurt: 6, restDuration: 103, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Donner", velocity: 25, spurt: 6, restDuration: 145, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Dasher", velocity: 11, spurt: 12, restDuration: 125, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Comet", velocity: 21, spurt: 6, restDuration: 121, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Blitzen", velocity: 18, spurt: 3, restDuration: 50, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Vixen", velocity: 20, spurt: 4, restDuration: 75, state: 1, time: 0, distanceFlown: 0, pts: 0},
			{name: "Dancer", velocity: 7, spurt: 20, restDuration: 119, state: 1, time: 0, distanceFlown: 0, pts: 0}]

# reindeer = [{name: "Comet", velocity: 14, spurt: 10, restDuration: 127, state: 1, time: 0, distanceFlown: 0, pts: 0},
# 			{name: "Dancer", velocity: 16, spurt: 11, restDuration: 162, state: 1, time: 0, distanceFlown: 0, pts: 0},]

input = ARGV.first.to_i
numTicks = 1

while(numTicks <= input)
	puts "Second " + numTicks.to_s + ": "
	leaderDistance = 0
	leader = 0
	reindeer.each{|r|
		#Reindeer's flying
		if(r[:state] == 1)
			if(r[:time] < r[:spurt])
				r[:distanceFlown] += r[:velocity]
				r[:time] += 1
			else
				r[:time] = 1
				r[:state] = 0
			end
		#Reindeer's resting
		else
			if(r[:time] < r[:restDuration])
				r[:time] += 1
			else
				r[:distanceFlown] += r[:velocity]
				r[:time] = 1
				r[:state] = 1
			end
		end

		if(r[:distanceFlown] > leaderDistance)
			leaderDistance = r[:distanceFlown]
		end
		p r[:name] + " has flown " + r[:distanceFlown].to_s + " km!"
	}

	reindeer.each{|r|
		if(r[:distanceFlown] == leaderDistance)
			r[:pts] += 1
		end

		p r[:name] + " has " + r[:pts].to_s + " points!"
	}
	# p reindeer[0][:name] + " has flown " + reindeer[0][:distanceFlown].to_s + " km!"
	# p reindeer[0][:name] + " has been in state: " + reindeer[0][:state].to_s + " for " + reindeer[0][:time].to_s + " seconds." 

	numTicks += 1
end
# input = ARGV.first.to_i

# farthestDistance = 0

# reindeer.each{|r|
# 	oneCycle = r[:spurt] + r[:restDuration]
# 	numCycles = input / oneCycle
# 	remainder = input % oneCycle

# 	distanceFlown = r[:velocity] * r[:spurt] * numCycles

# 	if(remainder <= r[:spurt])
# 		distanceFlown += r[:velocity] * remainder
# 	end

# 	if(farthestDistance < distanceFlown)
# 		farthestDistance = distanceFlown
# 	end
# }

# p farthestDistance