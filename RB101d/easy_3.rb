# RB101-RB109 - Small Problems

# Write a program that solicits 6 numbers from the user, then prints a message
# that describes whether or not the 6th number appears amongst the first 5 numbers.
# array = []
# puts "==> Enter the 1st number:"
# array << gets.to_i
# puts "==> Enter the 2nd number:"
# array << gets.to_i
# puts "==> Enter the 3rd number:"
# array << gets.to_i
# puts "==> Enter the 4th number:"
# array << gets.to_i
# puts "==> Enter the 5th number:"
# array << gets.to_i
# puts "==> Enter the last number:"
# last = gets.to_i
#
# p array.include?(last) ? "The number #{last} appears in #{array}." : "The number #{last} does not appear in #{array}."

# Write a program that prompts the user for two positive integers, and then
# prints the results of the following operations on those two numbers: addition,
# subtraction, product, quotient, remainder, and power. Do not worry about
# validating the input.

# puts "==> Enter the first number:"
# first = gets.to_f
# loop do
# puts "==> Enter the second number:"
# second = gets.to_f
#   if second == 0
#     puts "Second number must be >0!"
#   else
#     puts "#{first} + #{second} = #{first + second}"
#     puts "#{first} - #{second} = #{first - second}"
#     puts "#{first} * #{second} = #{first * second}"
#     puts "#{first} / #{second} = #{first / second}"
#     puts "#{first} % #{second} = #{first % second}"
#     puts "#{first} ** #{second} = #{first ** second}"
#     break
#   end
# end

# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be counted
# as a character.

# puts "Please write word or multiple words: "
# words = gets.chomp
# chars = words.delete ' '
# puts %(There are #{chars.length} characters in "#{words}".)

# Create a method that takes two arguments, multiplies them together, and
# returns the result.

def multiply(num1, num2)
  num1 * num2
end

# p multiply([1,2,"a"], 3)

# Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself).

# def square(num)
#   multiply(num, num)
# end
#
# # p square(5) == 25
# # p square(-8) == 64
#
# def power(num, power)
#   num2 = num
#   i = (power - 1)
#   case
#   when power != ( 0 || 1 )
#     while i > 0
#     num2 = multiply(num, num2)
#     i -= 1
#     return num2 if i == 0
#     end
#   when power == 1
#       return num
#     when power == 0
#       return 1
#     end
# end
#
# puts power(5, 1)

# In this exercise, you will write a method named xor that takes two arguments,
# and returns true if exactly one of its arguments is truthy, false otherwise.

# def xor?(arg1, arg2)
#   (arg1 && !arg2) || (!arg1 && arg2) ? true : false
# end
#
# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false

# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

# def oddities(array)
#   new_array = []
#   array.each_with_index { |value, i| new_array << value if i.even? }
#   new_array
# end

# def oddities(array)
#   index = 1
#   for elem in array
#     array.delete_at(index)
#     index += 1
#   end
#   array
# end

# def oddities(array)
#   p array.to_h
# end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# Write a method that returns true if the string passed as an argument is a
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

def palindromic?(string)
  string == string.reverse
end

# Write a method that determines whether an array is palindromic; that is, the
# element values appear in the same sequence both forwards and backwards in the
# array. Now write a method that determines whether an array or a string is
# palindromic; that is, write a method that can take either an array or a string
# argument, and determines whether that argument is a palindrome. You may not
# use an if, unless, or case statement or modifier.

# def palindromic?(array)
#   array.to_s.delete("[,]") == array.to_s.reverse.delete("[,]")
# end

# p palindromic?([[1,2],[3],[2,1]]) == false
# p palindromic?([[1,2],[3],[1,2]]) == true
# p palindromic?(["a", "b", "a"]) == true
# p palindromic?([1,2,3,2,1]) == true
# p palindromic?([1,2,2,1,0]) == false
# p palindromic?(["A", "b", "a"]) == false
# p palindromic?('madam') == true
# p palindromic?('Madam') == false          # (case matters)
# p palindromic?("madam i'm adam") == false # (all characters matter)
# p palindromic?('356653') == true

# Write another method that returns true if the string passed as an argument is
# a palindrome, false otherwise. This time, however, your method should be
# case-insensitive, and it should ignore all non-alphanumeric characters. If you
# wish, you may simplify things by calling the palindrome? method you wrote in
# the previous exercise.

# def real_palindrome?(string)
#   alphanumeric = string.gsub(/[^\p{Alnum}]/, '')
#   alphanumeric.casecmp?(alphanumeric.reverse)
# end
#
# p real_palindrome?('madam') == true
# p real_palindrome?('Madam') == true           # (case does not matter)
# p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
# p real_palindrome?('356653') == true
# p real_palindrome?('356a653') == true
# p real_palindrome?('123ab321') == false

# Write a method that returns true if its integer argument is palindromic, false
# otherwise. A palindromic number reads the same forwards and backwards.

def leading_zero_check(input)
  input == input.to_s.to_i
end

def palindromic_number?(num)
  case
  when leading_zero_check(num)
    num.digits.join == num.to_s
  when !leading_zero_check(num)
    num.digits.join == num.to_s.reverse
  end
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true
p palindromic_number?(012030210) == true
p palindromic_number?(01232100) == false
p palindromic_number?(001232100) == true
p palindromic_number?(0001232100) == false






























































































#
