# Small Problems from RB101-RB109

# Build a program that randomly generates and prints Teddy's age. To get the
# age, you should generate a random number between 20 and 200.

# def teddys_age
#   age = (20..200).to_a.sample
#   puts "What is the name?"
#   name = gets.chomp
#   name == '' ? name = "Teddy" : name.capitalize!
#   puts "#{name} is #{age} years old!"
# end
#
# teddys_age

# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.
#
# Note: 1 square meter == 10.7639 square feet

# SQ_FT_TO_SQ_CM = 929.03
# SQ_FT_TO_SQ_IN = 144
#
# puts "Enter the length of the room in feet:"
# length = gets.to_f
# puts "Enter the width of the room in feet:"
# width = gets.to_f
# sq_ft = length * width
# sq_in = (sq_ft * SQ_FT_TO_SQ_IN).round(2)
# sq_cm = (sq_ft * SQ_FT_TO_SQ_CM).round(2)
# puts "The area of the room is #{sq_ft} square feet or #{sq_in} square inches
# or #{sq_cm} square centimeters."

# Create a simple tip calculator. The program should prompt for a bill amount and
# a tip rate. The program must compute the tip and then display both the tip and
# the total amount of the bill.

# puts "What is the bill?"
# bill = gets.to_f
# puts "What is the tip percentage?"
# tip_percent = gets.to_f
#
# tip = bill * (tip_percent * 0.01)
# total = tip + bill
#
# puts "The tip is $#{sprintf("%.2f", tip)}"
# puts "The total is $#{sprintf("%.2f", total)}"

# Build a program that displays when the user will retire and how many years
# she has to work till retirement.

# puts "What is your age?"
# age = gets.to_i
#
# puts "At what age would you like to retire?"
# retirement_age = gets.to_i
#
# year = Time.now.year
# years_to_go = retirement_age - age
# retirement_year = year + years_to_go
#
# puts "It's #{year}. You will retire in #{retirement_year}.
# You have only #{years_to_go} years of work to go!"

# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

# puts "What is your name?"
# name = gets.chomp!.capitalize
#
# if name.include?('!')
#   name.upcase!.chop!
#   puts "HELLO #{name}. WHY ARE WE SCREAMING?!"
# else
#   puts "Hello #{name}."
# end

# Print all odd numbers from 1 to 99, inclusive. All numbers should be printed
# on separate lines.

# (1..99).to_a.each { |elem| puts elem if elem % 2 != 0 }

# Use Integer#upto

# 1.upto(99) { |i| puts i if i.odd? }

# Array#select

# (1..99).to_a.select { |num| puts num if !num.even? }

# Integer#odd?

# puts (1..99).reject { |num| !num.odd? }

# Print the even numbers from 1 to 99, inclusive. All numbers should be
# printed on separate lines.

# puts (1..99).reject { |num| num.odd? }

# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

puts ">> Please enter an integer greater than 0:"
num = gets.to_i

loop do
  puts ">> Enter 's' to compute the sum, 'p' to compute the product."
  choice = gets.chomp.downcase

  if choice == 's'
    sum = (1..num).reduce(:+)
    puts "The sum of the integers between 1 and #{num} is #{sum}."
    break
  elsif choice == 'p'
    product = (1..num).reduce(:*)
    puts "The product of the integers between 1 and #{num} is #{product}."
    break
  else
    puts "#{choice} is not a valid choice. Try again!"
  end
end

# 




















































#
