# Going to play around and create a creative little text based
# 'game' or program like in "Learn Ruby Now"

def entersize
	temp = []
	puts "Please enter a size for your array: (min. 5, the larger the more difficult)"
	print "> "
	size = gets.chomp.to_i
	
	temp = (1..size).to_a
	return temp
end

def printarray(array)
	(0..array.length-1).each do |j|
	print "Fill: ", array[j], "\n"
	end
	print "\n"
end

def level_selector(size)
	level = ""
	if size <= 10 then
		level = "Easy"
	elsif size > 10 && size <= 20
		level = "Medium"
	elsif size > 20
		level = "Hard"
	else 
		level = "Invalid Level"
	end
	return level
end

def multipli(lvl, score)
	mplier = 1
	if lvl == "Easy" then
		# Easy
		score = score * mplier
	elsif lvl == "Medium"
		# Medium
		mplier = 1.25
		score = score * mplier
	elsif lvl == "Hard"
		# Hard
		mplier = 1.5
		score = score * mplier
	else 
		# Not valid
	end
	return score
end

# function to determine how many pts to subtract from a miss
def pts_mod(size, guess, num)
	if size <= 10 then
		# Easy
		if guess == (num-1) || guess == (num+1) then
			return true
		end
	elsif size > 10 && size <= 20 then
		# Medium
		if guess >= (num-2) && guess <= (num+2) then
			return true
		end
	elsif size > 20 then
		# Hard
		if guess >= (num-3) && guess <= (num-3) then
			return true
		end
	elsif size > 30 then
		
		if guess >= (num-5) && guess <= (num+5) then
			puts "Within 5."
		elsif guess >= (num-10) && guess <= (num+10) then
			puts "Within 10."
		else
			puts "Way out there."
		end
	else
		puts "Invalid."
	end
end
	
		



# --- #

puts "-~" * 24
puts "--Welcome to the game of arrays and for-loops.--"
puts "-~" * 24

fill = []
prompt = '> '

fill = entersize

if fill.length < 5 then
	puts "Please select a larger array, it will be needed in this game."
	fill.clear
	fill = entersize
end

#printarray(fill)

#sleep(0.5)
puts "Array completed..."

tokens = 3
points = 0
game = true
while game == true
	# Shuffle at beginning of game
	fill.shuffle!()
	#sleep(0.5)
	puts "Array shuffled!"
	#sleep(0.5)

	#printarray(fill)

	success = false
	num = fill[4]
	
	puts "I have selected a number from your array. Can you guess it?"
	puts "-" * 50

	size = fill.length
	guess_array = []
	tries = 3
	level = level_selector(fill.length)
	# multiplier = multipli(level)
	
	header = "[[[ Tries Left: "
	mid = " ||| Points: "
	rear = " ]]]"

	while success == false
		print header, tries, mid, points, " ||| Level: ", level, rear, "\n"
		print prompt
		guess = gets.chomp.to_i
		
		if guess == num then
			puts "Got it! +10!"
			success = true 
			
			if tries == 3 then
				puts "BONUS!! First try +10"
				points += multipli(level, 20)
			else
				points += multipli(level, 10)
			end
			
		elsif level == "Easy" && pts_mod(size, guess, num) == true then
			puts "Close!"
			guess_array << guess
			
			if points != 0 then 
				points -= 1
			end
		elsif level == "Medium" && pts_mod(size, guess, num) == true then
			puts "Within 3"
			guess_array << guess
			
			if points != 0 then 
				points -= 1
			end
		elsif level == "Hard" && pts_mod(size, guess, num) == true then
			puts "Within 5"
			guess_array << guess
			
			if points != 0 then 
				points -= 1
			end
		else 
			if tries != 1 then
				puts "Guess again!"
			else
				puts "Last guess!"
			end
			guess_array << guess
			
			if points != 0 then 
				points -= 3
			end
			
		end
		
		tries -= 1
		header[0] = ""
		rear[rear.length-1] = ""
		
		if tries == 0 && success == false then
			puts "Ran out of tries."
			tokens -= 1
			puts "Tokens left: #{tokens}"
			break
		end
		
	end
	
	if tokens <= 0 then
		break
	end

	sleep(0.5)
	
	puts "=" * 50
	puts "Score: #{points} ||| Tokens left: #{tokens} ||| Current size: #{size}"
	puts "-" * 50
	
	
	puts "Please select a number:\n1. Play again (Tokens left #{tokens})\n2. Change array size (current size #{size})\n3. Quit"
	print prompt
	play = gets.chomp.to_i
	
	if play == 2 then
		fill = entersize
		if fill.length < 5 then
			puts "Please select a larger array, it will be needed in this game."
			fill.clear
			fill = entersize
		end
	elsif play == 3 then
		game = false
	elsif play != 1 then
		puts "Incorrect option. Game will quit; are you sure you want that to happen? (Y/N)"
		print prompt
		again = gets.chomp
		
		if again == "N" || again == "n" then
			puts "Be more careful, bish"
		else
			game = false
		end
	else 
		game = true # continue 
	end
		
	puts "--" * 10
end

puts "Game over! Your final score was: #{points}. Would you like to record your high score? (Y/N)"
print prompt
hisc = gets.chomp

if hisc.downcase == "n" || hisc.downcase == "no" then
	puts "Okay, I won't record your score. Have a nice day!"
end

filename = "guess_highscore.txt"

puts "Please enter your name to go along with your score: "
print prompt
name = gets.chomp

file = open(filename, 'a')

file.write(name << " " << points.to_s)
file.write("\n")

puts "High score stored! Check out \"guess_highscore.txt\" to see all the scores."
puts "Press ENTER to leave game (for hidden command options press +)"

print prompt
ops = gets.chomp

if ops != "+" then
	file.close
else
	puts "1. Clear high score table\n2. Sort high score table\n#. More options coming soon..."
	
	print prompt
	dev = gets.chomp
	
	if dev == "1" then
		file.truncate(0)
		puts "High scores cleared"
	elsif dev == "2" then
		puts "Sort - work in progress" 
	else
		puts "Invalid option"
	end
	
	file.close
end
