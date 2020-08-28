require 'pry'
# Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

# def sum_of_sums(arr)
#   num = []
#   size = 1
#   loop do
#     num << arr[0, size]
#     break if size == arr.size
#     size += 1
#   end
#   num.flatten.sum
# end
#
#
#
# # Examples:
# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

# Create a simple mad-lib program that prompts for a noun, a verb, an adverb, and an adjective and injects those into a story that you create.

# puts 'Enter a noun:'
# noun = gets.chomp.downcase
# puts 'Enter a verb:'
# verb = gets.chomp.downcase
# puts 'Enter an adjective:'
# adjective = gets.chomp.downcase
# puts 'Enter an adverb:'
# adverb = gets.chomp.downcase
#
# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

# Do you walk your blue dog quickly? That's hilarious!

# Write a method that returns a list of all substrings of a string that start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

# In: single string
# Out: => array of strings
# Explicit: return substrings must start at beginning of input string and be arranged from shortest to longest substring
# Implicit: the substrings should retain the order of the original string

# def leading_substrings(str)
#   arr = []
#   loop do
#     break if str.size == arr.size
#     arr << str[0..arr.size]
#   end
#   arr
# end
# #
# # # Examples:
# # p leading_substrings('abc') == ['a', 'ab', 'abc']
# # p leading_substrings('a') == ['a']
# # p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
#
# # Write a method that returns a list of all substrings of a string. The returned list should be ordered by where in the string the substring begins. This means that all substrings that start at position 0 should come first, then all substrings that start at position 1, and so on. Since multiple substrings will occur at each position, the substrings at a given position should be returned in order from shortest to longest.
#
# # You may (and should) use the leading_substrings method you wrote in the previous exercise:
#
# # In: single string
# # Out: => array of substrings
# # Explicit: substrings must be ordered by element position and within each position be ordered again by length, shortest to longest
# # Implicit: the order of letters within substrings must be retained
#
# def substrings(str)
#   arr = []
#   index = 0
#   loop do
#     break if index == str.size
#     arr << leading_substrings(str[index..-1])
#     index += 1
#   end
#   arr.flatten
# end
# # # Examples:
# #
# # p substrings('abcde') == [
# #   'a', 'ab', 'abc', 'abcd', 'abcde',
# #   'b', 'bc', 'bcd', 'bcde',
# #   'c', 'cd', 'cde',
# #   'd', 'de',
# #   'e'
# # ]
#
# =begin
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
#
# You may (and should) use the substrings method you wrote in the previous exercise.
#
# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.
#
# In: single string
# Out: array of substrings
# Explicit: return all palindromic substrings of a given string, in the order in which they appear in original string, all duplicates must also be included. Different cases are not equal. There must be at least 2 characters in each palindrome.
# Implicit: palindromes should be returned largest to smallest
# =end
# def alphanumericize(string)
#   string.scan(/\w/).join
# end
#
# def palindromes(str)
#   new_str = alphanumericize(str)
#   binding.pry
#   all_subs = substrings(new_str)
#   arr = all_subs.select do |substr|
#     substr == substr.reverse
#   end
#   arr.select { |subs| subs.size > 1 }
# end
#
# # Examples:
#
# p palindromes('abcd') == []
# p palindromes('madam') == ['madam', 'ada']
# p palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# p palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]

# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

# In: two integers
# Out: => output series of strings separated by commas
# Explicit: make a list of numbers between two given numbers, substituting the strings fizz, buzz or fizzbuzz if the number is divisible by 3, 5 or both respectively
# Implicit: print out the beginning and end numbers also

# def fizzbuzz(start, finish)
#   fb = (start..finish).map do |e|
#     if e % 3 == 0 && e % 5 == 0
#       'FizzBuzz'
#     elsif e % 3 == 0
#       'Fizz'
#     elsif e % 5 == 0
#       'Buzz'
#     else
#       e
#     end
#   end
#   puts fb.join ', '
# end
# # Example:
#
# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz


# Write a method that takes a string, and returns a new string in which every character is doubled.

=begin
In: string
Out: => string
Explicit: Double every character in a given string
Implicit: don't modify original string
=end

=begin
In:
Out:
Explicit:
Implicit:
=end

def repeater(str)
  str.gsub(/./) { |chr| chr * 2 }
end
# Examples:

# p repeater('Hello') == "HHeelllloo"
# p repeater("Good job!") == "GGoooodd  jjoobb!!"
# p repeater('') == ''

# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=begin
In: string
Out: => string
Explicit: double only consonant characters in a given string
Implicit: any non-consonant chars should retain their relative position in return
=end
# CONSONANTS = "BCDFGHJKLMNPQRSTVWXYZ"
# def double_consonants(str)
#   str.gsub(/./) { |chr| CONSONANTS.include?(chr.upcase) ? chr * 2 : chr }
# end
#
# # Examples:
#
# p double_consonants('String') == "SSttrrinngg"
# p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
# p double_consonants("July 4th") == "JJullyy 4tthh"
# p double_consonants('') == ""

# Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

=begin
In: positive integer
Out: => positive integer
Explicit: reverse the given number
Implicit: the return must also be an integer
=end

# def reversed_number(num)
#   num.to_s.reverse!.to_i
# end
#
# # Examples:
#
# p reversed_number(12345) == 54321
# p reversed_number(12213) == 31221
# p reversed_number(456) == 654
# p reversed_number(12000) == 21 # No leading zeros in return value!
# p reversed_number(12003) == 30021
# p reversed_number(1) == 1

# Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. If the argument has an odd length, you should return exactly one character. If the argument has an even length, you should return exactly two characters.

=begin
In: non-zero size string
Out: => 1 or 2 char string
Explicit: return middle character of odd length string, middle two characters from even length string
Implicit: count all characters, including spaces
=end

=begin
In:
Out:
Explicit:
Implicit:
=end

def center_of(str)
  str.size.even? ? str[((str.size / 2) - 1), 2] : str[(str.size / 2)]
end
# Examples:

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'


=begin
In: integer (range?)
Out: printed string using '*' char in diamond shape
Explicit: diamond max width defined by input integer
Implicit: output string length changes by two char per line if input integer is odd and each line printed will also be an odd number of chars (how to handle even?)
=end

=begin
In: integer representing year (range?)
Out: => string starting with number appended with st, nd, rd or th and century
Explicit: century number is determined by the number of years rounded up to the next hundred if not completely divisible by one hundred, then divided by one hundred (what to do with negative years?)
Implicit: 1 = st, 2 = nd, 3 = rd, 4-0 = th except teens
=end

=begin
In: string (more than one word? have to be real?)
Out: integer (return or printed?)
Explicit: compute how much a given word would be worth in a scrabble game
Implicit: total score for a word is determined by adding up the indiviual letter values specified by scrabble rules
=end

=begin
In: string with numbers in it (are numbers always integers?)
Out: => an integer
Explicit: solve math problems written in words and numbers (which specific operations?)
Implicit: Be able to solve at least add/sub/multi/div problems, use the keywords to identify what operation is needed
Data Structures: numbers (we need to do math and our output will be integers anyway) and hash to look up operation via key word
 =end

 =begin
 In: string (include non-alphabetic chars?)
 Out: => array of strings
 Explicit: returned substrings should be ordered first by position of index, 0 to end of string, and within indexes by length, single letter to rest of remaining letters
 Implicit:
 Data Structure: array to store substrings, string for getting substrings
 Algorithm:
 * select portion of string starting at position 0 and with length 1
 * increment length by 1, repeat substring selection until last char is reached
 * increment starting position by 1, repeat selection and length increment until starting position is at end of string
 =end

 =begin
 In: position of pieces in either string (representing board) or (x,y) numbers in string or integer?
 Out: string (yes/no) or boolean answer to question
 Explicit: answer whether two queens in given positions are able to attack each other using rules of chess, ie valid attack positions are: same row, column or diagonal
 Implicit:
 Data Structure: hash, key as B/W queen and value as two element array (first is x position, second is y) position
 Algorithm:
 * either scan given string for B/W queen positions or take directly from given string/numbers
 * check positions for same x value, y value and whether the x and y distances are the same (diagonal distance is square), if true for any, return yes, else no
 =end


 =begin
 In:
 Out:
 Explicit:
 Implicit:
 Examples:
 Data Structures:
 Algorithm:
 *
 *
 *
 =end























































































#
