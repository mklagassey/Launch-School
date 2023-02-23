# Write an if statement that prints "The sun is so bright!" if sun equals 'visible'.

# sun = ['visible', 'hidden'].sample

# if sun == 'visible'
#   puts "The sun is so bright!"
# end

# Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.

# puts "The clouds are blocking the sun!" unless sun == 'visible'
# puts "The sun is so bright!" if sun == 'visible'

# Write an if statement that prints "The sun is so bright!" if sun equals visible. Also, write an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.

# When writing these statements, take advantage of Ruby's expressiveness and use statement modifiers instead of an if...end statement to print results only when some condition is met or not met.

# Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!" if boolean equals false.

# boolean = [true, false].sample
#
# puts boolean == true ? "I'm true" : "I'm false"

# Write a case statement that prints "Go!" if stoplight equals 'green', "Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.

# stoplight = ['green', 'yellow', 'red'].sample
#
# puts case stoplight
# when 'green'
#   "Go!"
# when 'yellow'
#   "Slow down!"
# when 'red'
#   "Stop!"
#
# end

# Convert the following case statement to an if statement.
# stoplight = ['green', 'yellow', 'red'].sample

# case stoplight
# when 'green'
#   puts 'Go!'
# when 'yellow'
#   puts 'Slow down!'
# else
#   puts 'Stop!'
# end

# if stoplight == 'green'
#   puts 'Go!'
# elsif stoplight == 'yellow'
#   puts 'Slow down!'
# else
#   puts 'Stop!'
# end

# Write an if statement that returns "Be productive!" if status equals 'awake' and returns "Go to sleep!" otherwise. Then, assign the return value of the if statement to a variable and print that variable.

# status = ['awake', 'tired'].sample
#
# action = if status == 'awake'
#   "Be productive!"
# else
#   "Go to sleep!"
# end
#
# puts action

# Currently, "5 is a cool number!" is being printed every time the program is run. Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

# number = rand(10)
#
# if number == 5
#   puts '5 is a cool number!'
# else
#   puts 'Other numbers are cool too!'
# end

# Reformat the following case statement so that it only takes up 5 lines.

stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green' then puts 'Go!'
when 'yellow' then puts 'Slow down!'
else puts 'Stop!'
end






































#
