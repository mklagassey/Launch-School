# Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.
# Input: 1 string, 1 positive integer
# Output: input string, printed x input integer
# Example:
# repeat('Hello', 3)
# prints
# Hello
# Hello
# Hello
# Data Structure: String & integer
# Algorithm:
#   Check inputs are exactly 1 string and 1 integer
#   Set print_loop_counter to input integer
#   Iterate for print_loop_counter times, print input string once per loop

# def print_string_x_times(integer, string)
#   return if (!integer.integer? || integer < 1)
#
#   print_loop_counter = integer
#
#   while print_loop_counter > 0
#     puts string
#     print_loop_counter -= 1
#   end
#
# end
#
# print_string_x_times(3, "Yo")

# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value. Keep in mind that you're not allowed to use #odd? or #even? in your solution.

# in: 1 int no restrictions on sign, will always be valid int
# out: boolean
# ds: int, boolean
# algo:
#   find absolute value of input integer
#   use modulo 2 to determine if int is even
#   if int is even, print false else print true
# Example


# def is_odd?(int)
#   absolute_int = 0
#
#   if int >= 0
#     absolute_int = int
#   else
#     absolute_int = -int
#   end
#
#   # absolute_int % 2 == 0
#   absolute_int.remainder(2) != 0
# end
#
# puts is_odd?(2)    # => false
# puts is_odd?(5)    # => true
# puts is_odd?(-17)  # => true
# puts is_odd?(-8)   # => false
# puts is_odd?(0)    # => false
# puts is_odd?(7)    # => true

# is_odd?(1)

# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1. The length of the string should match the given integer.

# in: 1 positive int, no guarantee of validity
# out: string, alternating '1' and '0', first is always '1'
# implicit: do not accept non-positive ints or strings
# ds: int, string, array
# algo:
#   determine int is valid
#   create empty array
#   for size of int, Iterate w/index
#     if index is odd append '1' to array, else append '0'

# def stringy(string_length, start_with='1')
#
#   # put int check here
#   return_string = ""
#   string_length.times do |index|
#     if start_with == '1'
#       return_string << (index.even? ? '1' : '0')
#     else
#       return_string << (index.even? ? '0' : '1')
#     end
#   end
#   return_string
# end
# stringy("1")
# Example, all should be 'true':
# puts stringy(6) == '101010'
# puts stringy(6, 0) == '010101'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# in: 1 pos int, 1 boolean
# Output: int
# ds: ints
# algo:
#   check inputs are valid
#   if bool input is true, divide int input in half and return
#   else return 0

# def calculate_bonus(salary, apply_bonus)
#   apply_bonus ? salary / 2 : 0
# end
# # Examples
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000

# Write a method that will take a short line of text, and print it within a box.

# in: string
# out: string
# explicit: original input string should be between two other lines with | prepended
# and appended
# ds: strings
# algo:
#   create base string for top and bottom of box
#   create secondary string for box buffer zone
#   set expand_by variable to length of input string
#   expand base string with - for expand_by
#   expand buffer string with space for expand_by
#   set input string in center line

def print_in_box(message)
  expand_by = message.size + 2
  top_bottom_string = '+' << '--'.center(expand_by, '-') << '+'
  middle_string = '|' << '  '.center(expand_by, ' ') << '|'

  puts top_bottom_string
  puts middle_string
  puts '|' << message.center(expand_by, ' ') << '|'
  puts middle_string
  puts top_bottom_string

end


print_in_box('')
print_in_box('Hello there!')












































#
