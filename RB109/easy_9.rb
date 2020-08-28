# Create a method that takes 2 arguments, an array and a hash. The array will contain 2 or more elements that, when combined with adjoining spaces, will produce a person's name. The hash will contain two keys, :title and :occupation, and the appropriate values. Your method should return a greeting that uses the person's full name, and mentions the person's title and occupation.

=begin
In: array w/ >= 2 elements, hash w/ 2 k/v pairs, keys = :title, :occupation * any restrictions on input? how to handle less than 2 elements for name?
Out: => interpolated string using both inputs
Explicit: use array elements with spaces to create name and hash values to describe title and occupation
Implicit: the greeting should be in the format shown in the example
Examples: Hello, John Q Doe! Nice to have a Master Plumber around.
Data Structures: use template string with interpolated string variables
Algorithm:
*iterate through input array elements, assigning each to new string variable
*get values from hash and assign each to new string variables
*return completed string
=end

# def greetings(arr, hash)
#   name = arr.join(' ')
#   "Hello, #{name}! Nice to have a #{hash[:title]} #{hash[:occupation]} around."
# end
#
# # Example:
#
# puts greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

# Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

=begin
In: number (always integers? how to handle something else?)
Out: also a number
Explicit: multiply input number by 2 unless it meets requirements for 'double number', in which case return the same number input
Implicit:
Data Structures: string
Algorithm:
* check if number is double
** convert to string
** get size, if even continue, else false
** split string into two even sized substrings
** compare substrings, if == true, else false
* if number is double, return same, else multiply by 2 and return result
*
=end
# def double?(num)
#   str = num.to_s
#   size = str.size
#   if size.odd?
#     false
#   else
#     str.start_with? str[(size / 2)..-1]
#   end
# end
#
# def twice(num)
#   double?(num) ? num : num * 2
# end
#
# # Examples:
# p twice(2) == 4
# p twice(37) == 74
# p twice(44) == 44
# p twice(334433) == 668866
# p twice(444) == 888
# p twice(107) == 214
# p twice(103103) == 103103
# p twice(3333) == 3333
# p twice(7676) == 7676
# p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# p twice(5) == 10

# Write a method that takes a number as an argument. If the argument is a positive number, return the negative of that number. If the number is 0 or negative, return the original number.

=begin
In: number (integer? range?)
Out: number
Explicit: return original number if it is 0 or negative, otherwise return negative of number
Implicit:
Data Structures: numbers
Algorithm:
* check if number is positive
* true: convert to negative
* false: return number
=end

# def negative(num)
#   num.negative? || num == 0 ? num : -num
# end
#
# # Examples:
#
# p negative(5) == -5
# p negative(-3) == -3
# p negative(0) == 0      # There's no such thing as -0 in ruby

# Write a method that takes an integer argument, and returns an Array of all integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is greater than 0.

=begin
In: integer greater than 0
Out: => array with integer elements
Explicit: return array with all integers from 1 up to input integer
Implicit: include input num in output array
Data Structures: array
Algorithm:
* create new array with same number of elements as input num
* assign each element an integer according to its index + 1
*
=end

# def sequence(num)
#   arr = Array.new(num)
#   arr.map.with_index { |x, i| x = i+1 }
# end
#
# # Examples:
#
# p sequence(5) == [1, 2, 3, 4, 5]
# p sequence(3) == [1, 2, 3]
# p sequence(1) == [1]

# Write a method that takes a string argument, and returns true if all of the alphabetic characters inside the string are uppercase, false otherwise. Characters that are not alphabetic should be ignored.

=begin
In: string
Out: => boolean
Explicit: return true if all the letters in given string are uppercase, ignore other chars for evaluation purposes, else return false
Implicit:
Data Structures: string
Algorithm:
* compare input string to input string upcased
*
*
=end

# def uppercase?(str)
#   str == str.upcase
# end
#
# # Examples:
#
# p uppercase?('t') == false
# p uppercase?('T') == true
# p uppercase?('Four Score') == false
# p uppercase?('FOUR SCORE') == true
# p uppercase?('4SCORE!') == true
# p uppercase?('') == true

# Write a method that takes a string as an argument, and returns an Array that contains every word from the string, to which you have appended a space and the word length.

# You may assume that words in the string are separated by exactly one space, and that any substring of non-space characters is a word.

=begin
In: string
Out: => array of string elements
Explicit: return array with elements comprised of a substring containing each word from input string followed by a space and then the word length
Implicit: word length should be a number, non-alphanumeric chars are included in word length
Data Structures: array
Algorithm:
* split string into words
* iterate through word array and append a space and word length to each
*
=end

# def word_lengths(str)
#   str.split.map { |e| e + ' ' + "#{e.size}" }
# end
#
# # Examples
#
# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
#
# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
#
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
#
# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]
#
# p word_lengths("") == []

# Write a method that takes a first name, a space, and a last name passed as a single String argument, and returns a string that contains the last name, a comma, a space, and the first name.

=begin
In: string with two words separated by a space (how to handle wrong format?)
Out: string
Explicit: take two word name and reverse words, separated by a comma and a space in that order
Implicit: do not change the names
Data Structures: string
Algorithm:
* split string into words
* use words to form new string with concatenation
*
=end

# def swap_name(str)
#   arr = str.split
#   "#{arr[1]}, #{arr[0]}"
# end
#
# # Examples
#
# p swap_name('Joe Roberts') == 'Roberts, Joe'

# Create a method that takes two integers as arguments. The first argument is a count, and the second is the first number of a sequence that your method will create. The method should return an Array that contains the same number of elements as the count argument, while the values of each element will be multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or greater, while the starting number can be any integer value. If the count is 0, an empty list should be returned.

=begin
In: two integers
Out: => array of integers
Explicit: return array with same number of elements specified by first argument, element values are multiples of second argument, if number of arguments is 0, return empty array
Implicit: element values should be ordered by increasing absolute value, multiply second argument by position in array
Data Structures: numbers and array
Algorithm:
* create array with number of elements specified by first arg
* map values to new array by multiplying second arg by index + 1
*
=end

# def sequence(first, second)
#   arr = Array.new first
#   arr.map.with_index { |e, i| e = (i + 1) * second }
# end
#
# # Examples:
#
# p sequence(5, 1) == [1, 2, 3, 4, 5]
# p sequence(4, -7) == [-7, -14, -21, -28]
# p sequence(3, 0) == [0, 0, 0]
# p sequence(0, 1000000) == []

# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.
# Numerical Score Letter 	Grade
# 90 <= score <= 100 	'A'
# 80 <= score < 90 	'B'
# 70 <= score < 80 	'C'
# 60 <= score < 70 	'D'
# 0 <= score < 60 	'F'

# Tested values are all between 0 and 100. There is no need to check for negative values or values greater than 100.

=begin
In: three numbers (always integers? out of range?)
Out: => letter string
Explicit: average three given numbers and return the letter grade associated, inputs are always between 0-100
Implicit:
Data Structures: numbers
Algorithm:
* add three inputs and divide by 3
* check average against score rules to get grade
*
=end

# def get_grade(first, second, third)
#   score = (first + second + third) / 3
#   if 90 <= score && score <= 100
#     return 'A'
#   elsif 80 <= score && score < 90
#     return 'B'
#   elsif 70 <= score && score < 80
#     return 'C'
#   elsif 60 <= score && score < 70
#     return 'D'
#   elsif 0 <= score && score < 60
#     return 'F'
#   end
# end
#
# # Example:
#
# p get_grade(95, 90, 93) == "A"
# p get_grade(50, 50, 95) == "D"

# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.

=begin
In: array of arrays
Out: array
Explicit: convert given array of arrays to flat array with fruits repeated number of times given in second element of subarray
Implicit: order of fruits should be maintained
Data Structures: nested arrays
Algorithm:
* create new subarrays with specified number of each fruit from given subarrays
* append each new subarray to new container array
* flatten container array
=end

def buy_fruit(arr)
  new_arr = arr.map { |e| [e[0]] * e[1] }
  new_arr.flatten
end

# Example:

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
