# Write a method that takes a floating point number that represents an angle
# between 0 and 360 degrees and returns a String that represents that angle in
# degrees, minutes and seconds. You should use a degree symbol (°) to represent
# degrees, a single quote (') to represent minutes, and a double quote (") to
# represent seconds. A degree has 60 minutes, while a minute has 60 seconds.
# DEGREE = "\xC2\xB0"
#
# def dms(float)
#   deg = (float.to_i) % 360
#   decimals = float - float.to_i
#   minutes = (decimals * 60).to_i
#   seconds = (((decimals * 60) - minutes) * 60).to_i
#   "#{deg}#{DEGREE}#{minutes.to_s.rjust(2, '0')}'#{seconds.to_s.rjust(2, '0')}\""
# end
#
# p dms(30) == %(30°00'00")
# p dms(76.73) == %(76°43'48")
# p dms(254.6) == %(254°36'00")
# p dms(93.034773) == %(93°02'05")
# p dms(0) == %(0°00'00")
# p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
# p dms(400) == %(40°00'00")
# p dms(-40) == %(320°00'00")
# p dms(-420) == %(300°00'00")

# Write a method that takes an array of strings, and returns an array of the
# same string values, except with the vowels (a, e, i, o, u) removed.
# VOWELS = 'aeiou'
# def remove_vowels(array)
#   array.map do |e|
#     new_arr = e.split('')
#     without_vowels_arr = new_arr.delete_if { |x| VOWELS.include?(x.downcase) }
#     without_vowels_arr.join
#   end
# end
#
#
# p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

# def find_fibonacci_index_by_length(digits)
#   first_num = 1
#   second_num = 1
#   counter = 2
#   loop do
#     break if second_num.digits.size >= digits
#     sum = second_num + first_num
#     first_num = second_num
#     second_num = sum
#     counter += 1
#   end
#   counter
# end
#
# p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# p find_fibonacci_index_by_length(10) == 45
# p find_fibonacci_index_by_length(100) == 476
# p find_fibonacci_index_by_length(1000) == 4782
# p find_fibonacci_index_by_length(10000) == 47847

# Write a method that takes an Array as an argument, and reverses its elements
# in place; that is, mutate the Array passed into this method. The return value
# should be the same Array object.
# You may not use Array#reverse or Array#reverse!.

# def rev_arr!(array)
#   counter = 0
#   loop do
#     break if counter == array.size
#     array.insert(counter, array[-1])
#     array.delete_at(-1)
#     counter += 1
#   end
#   array
# end
#
# arr = [1,2,3,4,5]
# puts "Array is #{arr} and the id is: #{arr.object_id} before method."
# rev_arr!(arr)
# puts "Array is #{arr} and the id is: #{arr.object_id} after method."
# list = %w(a b e d c)
# puts "List is #{list} and the id is: #{list.object_id} before method."
# rev_arr!(list)
# puts "List is #{list} and the id is: #{list.object_id} after method."
# empty = []
# puts "Empty array is #{empty} and the id is: #{empty.object_id} before method."
# rev_arr!(list)
# puts "Empty array is #{empty} and the id is: #{empty.object_id} after method."

# Write a method that takes an Array, and returns a new Array with the elements
# of the original list in reverse order. Do not modify the original list.

# def rev_arr(array)
#   rev_arr = []
#   count = 1
#   while rev_arr.size < array.size
#     rev_arr.append(array[-count])
#     count += 1
#   end
#   rev_arr
# end

# def rev_arr(array)
#   array.each_with_object([]) { |elem, arr| arr.prepend(elem) }
# end
#
# arr = [1,2,3,4,5]
# puts "Array is #{arr} and the id is: #{arr.object_id} before method."
# p rev_arr(arr)
# p rev_arr(arr).object_id
# puts "Array is #{arr} and the id is: #{arr.object_id} after method."
# list = %w(a b e d c)
# puts "List is #{list} and the id is: #{list.object_id} before method."
# p rev_arr(list)
# p rev_arr(list).object_id
# puts "List is #{list} and the id is: #{list.object_id} after method."
# empty = []
# puts "Empty array is #{empty} and the id is: #{empty.object_id} before method."
# p rev_arr(empty)
# p rev_arr(empty).object_id
# puts "Empty array is #{empty} and the id is: #{empty.object_id} after method."

# Write a method that takes two Arrays as arguments, and returns an Array that
# contains all of the values from the argument Arrays. There should be no
# duplication of values in the returned Array, even if there are duplicates in
# the original Arrays.

# def merge(arr1, arr2)
#   merged_arr = arr1 + arr2
#   merged_arr.uniq
# end
#
# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# Write a method that takes an Array as an argument, and returns two Arrays
# (as a pair of nested Arrays) that contain the first half and second half of
# the original Array, respectively. If the original array contains an odd
# number of elements, the middle element should be placed in the first half
# Array.

# def halvsies(array)
#   sub_arr1 = array.slice(0, (array.size / 2) + (array.size % 2))
#   sub_arr2 = array.slice(sub_arr1.size..-1)
#
#   [sub_arr1, sub_arr2]
# end
#
# p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
# p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
# p halvsies([5]) == [[5], []]
# p halvsies([]) == [[], []]

# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.

# def find_dup(array)
#   array.tally.rassoc(2)[0]
# end
#
# p find_dup([1, 5, 3, 1]) == 1
# p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

# def include?(array, value)
#   array.any?(value)
# end
#
# p include?([1,2,3,4,5], 3) == true
# p include?([1,2,3,4,5], 6) == false
# p include?([], 3) == false
# p include?([nil], nil) == true
# p include?([], nil) == false

# Write a method that takes a positive integer, n, as an argument, and displays
# a right triangle whose sides each have n stars. The hypotenuse of the triangle
# (the diagonal side in the images below) should have one end at the lower-left
# of the triangle, and the other end at the upper-right.

def triangle(n)
  star = '*'
  for stars in 1..n
    puts star.rjust(n)
    star << '*'
  end
end

triangle(9)





























#
