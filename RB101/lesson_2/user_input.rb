# Write a program that asks the user to type something in, after which your program should simply display what was entered.

# puts "Write something already..."
# puts gets.chomp

# Write a program that asks the user for their age in years, and then converts that age to months.

# puts "What is your age in years?"
#
# age = gets.chomp.to_i
#
# months_age = age * 12
#
# puts "You are #{months_age} months old!"

# Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. Otherwise, print nothing.
# Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response. In addition, your program should allow both Y and N (uppercase) responses; case sensitive input is generally a poor user interface choice. Whenever possible, accept both uppercase and lowercase inputs.

# def valid_input(input)
#   input.downcase.start_with?("y", "n")
# end
#
# def ask_for_input()
#   puts "Do you want me to print something? (y/n)"
#   gets.chomp
# end
#
# answer = ''
# loop do
#   answer = ask_for_input
#   if valid_input(answer)
#     puts "Something" if answer.downcase.start_with?("y")
#     break
#   else
#     puts "Sorry, that input is invalid, try again with a 'y' or 'n' answer!"
#   end
#
# end

# Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

# For now, just use #to_i to convert the input value to an Integer, and check that result instead of trying to insist on a valid number; validation of numeric input is a topic with a fair number of edge conditions that are beyond the scope of this exercise.

def valid_input(input)
  input >= 3
end

answer = ''
puts "---------------------------------------------"
loop do
  puts "How many lines should we print? Minimum is 3"
  answer = gets.chomp.to_i

  if valid_input(answer)
    while answer > 0
      puts "Launch School is the best!"
      answer -= 1
    end
    break
  else
    puts "Sorry, but that number is incorrect!"
  end
end


































#
