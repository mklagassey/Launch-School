# Write a method that combines two Arrays passed in as arguments, and returns a
# new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.
# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# def interleave(arr1, arr2)
#   counter = 0
#   new_arr = []
#   loop do
#     break if arr1.size == counter
#     new_arr << arr1[counter]
#     new_arr << arr2[counter]
#     counter += 1
#   end
#   new_arr
# end

# def interleave(arr1, arr2)
#   arr1.zip(arr2).flatten
# end
#
# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# Write a method that takes a string, and then returns a hash that contains 3
# entries: one represents the number of characters in the string that are
# lowercase letters, one the number of characters that are uppercase letters,
# and one the number of characters that are neither.

# def letter_case_count(string)
#   hash = { lowercase: 0, uppercase: 0, neither: 0 }
#   string.each_char do |char|
#     if ('a'..'z').cover?(char)
#       hash[:lowercase] += 1
#     elsif ('A'..'Z').cover?(char)
#       hash[:uppercase] += 1
#     else
#       hash[:neither] += 1
#     end
#   end
#   hash
# end
#
# p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.
# You may assume that words are any sequence of non-blank characters.

# def word_cap(string)
#   string.split.map { |e| e.capitalize }.join(' ')
# end

# def word_cap(string)
#   arr = string.split.map do |e|
#     e.chars.map.with_index { |e, i| i == 0 ? e.upcase : e.downcase }.join
#   end
#   arr.join(' ')
# end
#
# p word_cap('four score and seven') == 'Four Score And Seven'
# p word_cap('the javaScript language') == 'The Javascript Language'
# p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use String#swapcase; write your own version of this method.

# def swapcase(string)
#   string.chars.map { |e| e.upcase == e ? e.downcase : e.upcase }.join
# end
#
# p swapcase('CamelCase') == 'cAMELcASE'
# p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

# Write a method that takes a String as an argument, and returns a new String
# that contains the original value using a staggered capitalization scheme in
# which every other character is capitalized, and the remaining characters are
# lowercase. Characters that are not letters should not be changed, but count
# as characters when switching between upper and lowercase.

# def staggered_case(string)
#   string.chars.map.with_index { |e, i| i.even? ? e.upcase : e.downcase }.join
# end

# def staggered_case(string, first_upper = true)
#   result = ''
#   string.chars.each do |char|
#     if first_upper
#       result += char.upcase
#     else
#       result += char.downcase
#     end
#     first_upper = !first_upper
#   end
#   result
# end
#
# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('I Love Launch School!', false)
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ALL_CAPS', false)
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# p staggered_case('ignore 77 the 444 numbers', false)

# Modify the method from the previous exercise so it ignores non-alphabetic
# characters when determining whether it should uppercase or lowercase each
# letter. The non-alphabetic characters should still be included in the return
# value; they just don't count when toggling the desired case.
# ALPHA = /[a-zA-Z]/
# def staggered_case(string)
#   upcase = true
#   new_str = string.chars.map do |char|
#     if ALPHA.match?(char)
#       if upcase == true
#         upcase = false
#         char.upcase
#       else
#         upcase = true
#         char.downcase
#       end
#     else
#       char
#     end
#   end
#   new_str.join
# end

# def staggered_case(string, only_alpha = true)
#   only_alpha == true ? char_set = /[a-z]/i : char_set = /[ -~]/
#   result = ''
#   need_upper = true
#   string.chars.each do |char|
#     if char =~ char_set
#       if need_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       need_upper = !need_upper
#     else
#       result += char
#     end
#   end
#   result
# end
#
# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# def show_multiplicative_average(arr)
#   puts "The result is " + sprintf("%.3f", (arr.reduce(:*).to_f / arr.size))
# end
#
# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each
# pair of numbers from the arguments that have the same index. You may assume
# that the arguments contain the same number of elements.

# def multiply_list(arr1, arr2)
#   output_arr = []
#   arr1.each_with_index {|num, i| output_arr << num * arr2[i] }
#   output_arr
# end

# def multiply_list(arr1, arr2)
#   arr1.map.with_index {|num, i| num * arr2[i] }
# end

# def multiply_list(arr1, arr2)
#   arr1.zip(arr2).map { |x, y| x * y }
# end

# p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of every
# pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

# You may assume that neither argument is an empty Array.

# def multiply_all_pairs(arr1, arr2)
#   new_arr = []
#   outer_count = 0
#   loop do
#     break if new_arr.size == (arr1.size * arr2.size)
#     multiplier = arr1[outer_count]
#     inner_count = 0
#     loop do
#       break if inner_count == arr2.size
#       new_arr << multiplier * arr2[inner_count]
#       inner_count += 1
#     end
#     outer_count += 1
#   end
#   new_arr.sort
# end
#
# p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# def penultimate(string)
#   string.split[-2]
# end
#
# p penultimate('last word') == 'last'
# p penultimate('Launch School is great!') == 'is'

# Further Exploration:
def middle_word(string)
  string.split.size.even? ? "No middle!" : string.split[string.split.size / 2]
end


# Test cases:
p middle_word("There can be only one.")         # => "be"
p middle_word("Except when it's even.")         # => "No middle!"
p middle_word("Supercalifragilistic.")          # => "Supercalifragilistic."
p middle_word("")                               # => "No middle!"



































































































#
