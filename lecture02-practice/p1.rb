# practice methods and conditionals

def add(x, y)
	x += 1
	y -= 1
	return x + y
end	

def count(message, time)
	i = time
	while i >= 0
		puts "#{i} #{message}"
		i -= 1
	end
end

def correct?(answer)
	boo = false
	if answer == "yes" then
		boo = true
		puts "Neat."
	elsif answer == "no" then
		boo = false
		puts "Scooby Snax"
	else
		puts "Chritopher Walken"
	end
	return boo
end

def question()
	ghostbuster = false
	puts "\'Say something I'm giving up on you.\' - Abraham Lincoln\nWhat do you know about that?"
	response = gets.chomp
	unless response == "-Melania Trump" then
		puts "Damn like a prickly pear"
	else
		puts "WOW! Correct!"
		ghostbuster = true
	end
	return ghostbuster
end


x,y = 20, 10

puts "About to print x and then y"
puts x
puts y

added = add(x,y)
puts "Just added #{x} and #{y} to get #{added}."
puts "But did you know there were actually two additional steps involved?"

puts "I'll tell you in... "
count("second(s)", 5)

puts "That wasn't quite enough time, so if you answer this correctly I'll tell you."

puts "Can you believe it is not butter????"
ans = gets.chomp

correct?(ans)

puts "\nYeahhhh... sorry about that. That was the wrong question. Whoops."

if question?() == true
	puts "Cows jump over the moon, you're correct!"
end 

puts "Unfortunately, this is all a joke and it doesn't mean anything."
puts "Did I say so?"
said = gets.chomp
puts "Good news is that if you're seeing this is is because I said so!" if said == "so"
puts "Uh oh... You're only seeing this because I didn't say so..." if said != "so"




