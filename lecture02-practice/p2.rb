# Going to work with for loops, arrays
### Small custom program with loops / arrays down below ###
#-------------------------------------------#
#	highlight from '#!#' to the next one 	#
#	and press CTRL-SHIFT-Q					#
#											#
#-------------------------------------------#

#!# #!# #!# #!# #!# #!# #!# #!# #!# #!# #!# #!# 

# count = [1, 2, 3, 4, 5]
# fruit = ['apple', 'orange', 'pear', 'banana']

# #for loop way #1 (python-like)
# for num in count
	# puts "This is #{num} in the array 'count'"
# end

# #for loop way #2
# fruit.each do |fruity|
	# puts "Fruit! Here: #{fruity}"
# end

# #for loop way #3
# fruit.each{|i| puts "I got Fruit \##{i}"}

# # build list
# elements = []

# (0..5).each do |i|
	# puts "adding #{i} to the list"
	# # push i onto end of list
	# elements.push(i)
# end

# # Another way (lecture notes) 
# for num in 0..3
	# puts "This is loop #{num}"
# end

#!# #!# #!# #!# #!# #!# #!# #!# #!# #!# #!# #!# 

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

fill = entersize

if fill.length < 5 then
	puts "Please select a larger array, it will be needed in this game."
	fill.clear
	fill = entersize
end

#printarray(fill)

puts "Array completed..."


points = 0
game = true
while game == true
	# Shuffle at beginning of game
	fill.shuffle!()
	puts "Array shuffled!"

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
		guess = gets.chomp.to_i
		
		if guess == num then
			puts "Got it! +10!"
			success = true 
			
			# multiplier depending on level
			points += multipli(level, 10)
			
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
			puts "Guess again!"
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
			break
		end
		
	end
	
	puts "Do you want to play again? (Y/N)"
	
	play = gets.chomp
	
	if play == "N" || play == "n" then
		game = false
	end
	
	puts "--" * 10
end

	
















