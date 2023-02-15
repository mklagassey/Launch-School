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

# Modify this program so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters q or Q.

# def valid_input(input)
#   input >= 3
# end
#
# answer = ''
# loop do
#   puts "---------------------------------------------"
#   puts "How many lines should we print? Minimum is 3 or press 'Q' to quit."
#   answer = gets.chomp
#   break if answer.downcase == 'q'
#
#   answer = answer.to_i
#   if valid_input(answer)
#     while answer > 0
#       puts "Launch School is the best!"
#       answer -= 1
#     end
#   else
#     puts "Sorry, but we need more lines than that!"
#   end
# end

# Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.
# In the previous exercise, you wrote a program to solicit a password. In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

# USER = "user"
# PASSWORD = "password"
#
# loop do
#   puts "What is your username?"
#   username = gets.chomp
#   puts "What is the password?"
#   pw = gets.chomp
#   break if pw == PASSWORD && username == USER
#   puts "Auth failure, this will be reported!"
# end
#
# puts "Welcome!"

# Write a program that asks the user to enter two integers, then prints the results of dividing the first by the second. The second number must not be 0. Since this is user input, there's a good chance that the user won't enter a valid integer. Therefore, you must validate the input to be sure it is an integer.

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
#
# puts "Welcome to divider!"
#
# numerator = ''
# loop do
#   puts "Please enter the numerator:"
#   numerator = gets.chomp
#   break if valid_number?(numerator)
#   puts "Sorry, only integers allowed, try again!"
# end
#
# denominator = ''
# loop do
#   puts "Please enter the denominator:"
#   denominator = gets.chomp
#   if !valid_number?(denominator)
#     puts "Sorry, only integers allowed, try again!"
#     next
#   end
#   if denominator == '0'
#     puts "Division by zero attempted! Resetting universe, try again."
#     next
#   end
#   break
# end
#
# puts "#{numerator} / #{denominator} = #{numerator.to_i / denominator.to_i}"

# Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

# Do not check for the positive/negative requirement until both integers are entered, and start over if the requirement is not met.
require 'pry'

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_user_number()
  puts "Enter your negative or positive integer now:"
  gets.chomp
end

def one_positive_one_negative_int?(num_uno, num_dos)
  (num_uno.negative? && num_dos.positive?) || (num_uno.positive? && num_dos.negative?)
end

puts "Directions: Enter one positive and one negative number in any order."

loop do
  first_num = get_user_number()
  if !valid_number?(first_num)
    puts "Sorry, that's not a valid non-zero integer, try again!"
    next
  end

  second_num = '0'
  loop do
    second_num = get_user_number()
    if !valid_number?(second_num)
      puts "Sorry, that's not a valid non-zero integer, try again!"
      next
    end
    break
  end

  first_num = first_num.to_i
  second_num = second_num.to_i
  if !one_positive_one_negative_int?(first_num, second_num)
    puts "Sorry, one integer must be positive and the other negative, start over!"
    next
  end

  puts "#{first_num} + #{second_num} = #{first_num + second_num}"
  break
end

















































#
