# Small Problems Exercises : Easy 1

# Write a method that takes two arguments, a string and a positive integer,
# and prints the string as many times as the integer indicates.

# def repeat(string, pos_int)
#   pos_int.times { puts string }
# end
#
# repeat("dude", 3)

# Write a method that takes one integer argument, which may be positive,
# negative, or zero. This method returns true if the number's absolute value
# is odd. You may assume that the argument is a valid integer value.

# def is_odd?(int)
#   int.abs.remainder(2) == 1
# end
# p is_odd?(2)
# p is_odd?(5)
# p is_odd?(-17)
# p is_odd?(-8)
# p is_odd?(0)
# p is_odd?(7)

# Write a method that takes one argument, a positive integer, and returns
# a list of the digits in the number.
#
# def digit_list(pos_int)
#   array = pos_int.to_s.split('')
#   array.map { |x| x.to_i }
# end
#
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]

# Write a method that counts the number of occurrences of each element
# in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'. ` Once counted,
# print each element alongside the number of occurrences.

# vehicles = [
#   'car', 'car', 'truck', 'car', 'SUV', 'truck',
#   'motorcycle', 'motorcycle', 'car', 'truck'
# ]
#
# def count_occurrences(array)
#   hash = array.group_by { |x| x }.transform_values { |num| num.count}
#   hash.each { |k, v| puts "#{k} => #{v}"}
# end
#
# count_occurrences(vehicles)

# Write a method that takes one argument, a string, and returns a new string
# with the words in reverse order.
#
# def reverse_sentence(string)
#   string.split.reverse.join(' ')
# end
#
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

# Write a method that takes one argument, a string containing one or more words,
# and returns the given string with words that contain five or more characters
# reversed. Each string will consist of only letters and spaces. Spaces should be
# included only when more than one word is present.

# def reverse_words(string)
#   string.split.each { |word| word.size >= 5 ? word.reverse! : word }.join(' ')
# end
#
# puts reverse_words('Professional')
# puts reverse_words('Walk around the block')
# puts reverse_words('Launch School')

# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

# def stringy(pos_int, opt = 1)
#   if opt == 1
#     Array.new(pos_int).fill { |i| i.even? ? 1 : 0 }.join
#   elsif opt == 0
#     Array.new(pos_int).fill { |i| i.odd? ? 1 : 0 }.join
#   end
# end
#
# puts stringy(5)

# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Write a method that takes one argument, an array containing integers, and
# returns the average of all numbers in the array. The array will never be
# empty and the numbers will always be positive integers.
#
# def average(int_array)
#   int_array.sum / int_array.size
# end
#
# puts average([1, 5, 87, 45, 8, 8]) == 25
# puts average([9, 47, 23, 95, 16, 52]) == 40

# Write a method that takes one argument, a positive integer, and returns the
# sum of its digits.
# def sum(pos_int)
#   pos_int.digits.sum
# end

# sum(23)
#
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

# Write a method that takes two arguments, a positive integer and a boolean,
# and calculates the bonus for a given salary. If the boolean is true, the bonus
# should be half of the salary. If the boolean is false, the bonus should be 0.

# def calculate_bonus(pos_int, bool)
#   bool == true ? pos_int / 2 : 0
# end
#
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000














































































#
