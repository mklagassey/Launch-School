# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

# def short_long_short(str1, str2)
#   str1.size > str2.size ? str2 + str1 + str2 : str1 + str2 + str1
# end
#
# # Examples:
#
# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# Write a method that takes a year as input and returns the century. The return
# value should be a string that begins with the century number, and ends with
# st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000
# comprise the 20th century.

# def century(year)
#   century = year % 100 != 0 ? (year / 100) + 1 : (year / 100)
#
#   if century.digits[0] == 0 || century.digits[1] == 1
#     "#{century}th"
#   elsif century.digits[0] == 1
#     "#{century}st"
#   elsif century.digits[0] == 2
#     "#{century}nd"
#   elsif century.digits[0] == 3
#     "#{century}rd"
#   else
#     "#{century}th"
#   end
# end
#
# # Examples:
#
# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'
# p century(2301) == '24th'

# In the modern era under the Gregorian Calendar, leap years occur in every
# year that is evenly divisible by 4, unless the year is also divisible by 100.
# If the year is evenly divisible by 100, then it is not a leap year unless the
# year is evenly divisible by 400.

# Assume this rule is good for any year greater than year 0. Write a method that
# takes any year greater than 0 as input, and returns true if the year is a leap
# year, or false if it is not a leap year.

# def leap_year?(year)
#   if year > 1751
#     year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
#   else
#     year % 4 == 0
#   end
# end
#
# p leap_year?(2016) == true
# p leap_year?(2015) == false
# p leap_year?(2100) == false
# p leap_year?(2400) == true
# p leap_year?(240000) == true
# p leap_year?(240001) == false
# p leap_year?(2000) == true
# p leap_year?(1900) == false
# p leap_year?(1752) == true
# p leap_year?(1700) == true
# p leap_year?(1) == false
# p leap_year?(100) == true
# p leap_year?(400) == true

# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples. For
# instance, if the supplied number is 20, the result should be
# 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# Using basic for loop

# def multisum(num)
#   sum = []
#
#   for int in 1..num
#     if int % 3 == 0 || int % 5 == 0
#       sum << int
#     end
#   end
#     sum.sum
# end

# Using Enumerable method

# def multisum(num)
#   sum = []
#
#   for int in 1..num
#    sum << int if int % 3 == 0 || int % 5 == 0
#  end
#
#   sum.inject(:+)
# end
#
# # Examples
#
# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# Write a method that takes an Array of numbers, and returns an Array with the
# same number of elements, and each element has the running total from the
# original Array.

# def running_total(array)
#   return_array = []
#
#   loop do
#     break if array.empty?
#     return_array << array.reduce(:+)
#     array.pop
#
#   end
#   return_array.reverse
#
# end

# def running_total(array)
#
# array.each_with_object([]) do |i, a|
#     if a.empty?
#       a << i
#     else
#       a << a[-1] + i
#     end
#   end
#
# end
#
# # Examples:
#
# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

# Write a method that takes a String of digits, and returns the appropriate
# number as an integer. You may not use String#to_i, Integer()

# def string_to_integer(str)
#
#   lookup = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
#   '6' => 6, '7' => 7, '8' => 8, '9' => 9 }
#
#   counter = -1
#   num = 0
#   multiplier = 1
#
#   loop do
#     break if -counter == str.size + 1
#
#     current_char = str[counter]
#     num += (lookup[current_char] * multiplier)
#
#     multiplier *= 10
#     counter -= 1
#   end
#
#   num
# end
#
#
# # Examples
#
# p string_to_integer('4321') == 4321
# p string_to_integer('570') == 570

# Write a hexadecimal_to_integer method that converts a string representing a
# hexadecimal number to its integer value.

# LOOKUP = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5,
#   '6' => 6, '7' => 7, '8' => 8, '9' => 9, 'A' => 10, 'B' =>	11, 'C'	=> 12,
#    'D' =>	13, 'E' => 14, 'F' =>	15 }
#
#
# def hexadecimal_to_integer(str)
#
#   counter = -1
#   num = 0
#   multiplier = 1
#
#   loop do
#     break if -counter == str.size + 1
#
#     current_char = str[counter]
#     num += (LOOKUP[current_char.upcase] * multiplier)
#
#     multiplier *= 16
#     counter -= 1
#   end
#
#   num
# end

# Example:

# p hexadecimal_to_integer('4D9f') == 19871

# def string_to_signed_integer(str)
#   if str.include?('-')
#     new_str = str.delete('-')
#     string_to_integer(new_str) * -1
#   elsif str.include?('+')
#     new_str = str.delete('+')
#     string_to_integer(new_str)
#   else
#     string_to_integer(str)
#   end
# end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

INT_TO_STR = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5",
               6 => "6", 7 => "7", 8 => "8", 9 => "9" }

def integer_to_string(int)
  exp = 1
  num_string = ''

  loop do
    num = int % 10**exp
    place = num / 10**(exp - 1)

    num_string << INT_TO_STR[place]

    break if int == num
    exp += 1
  end
  num_string.reverse
end


p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# def signed_integer_to_string(int)
#   if int == 0
#     integer_to_string(int)
#   elsif int.abs - int == 0
#     integer_to_string(int).prepend '+'
#   else
#     integer_to_string(int.abs).prepend '-'
#   end
# end
#
#
# p signed_integer_to_string(4321) == '+4321'
# p signed_integer_to_string(-123) == '-123'
# p signed_integer_to_string(0) == '0'












































































































































































































































































#
