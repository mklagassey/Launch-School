# Write a method that determines and returns the ASCII string value of a string
# that is passed in as an argument. The ASCII string value is the sum of the
# ASCII values of every character in the string. (You may use String#ord to
# determine the ASCII value of a character.)

# def ascii_value(str)
#   val =[]
#   str.each_char { |chr| val << chr.ord  }
#   val.sum
# end
#
# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# The time of day can be represented as the number of minutes before or after
# midnight. If the number of minutes is positive, the time is after midnight.
# If the number of minutes is negative, the time is before midnight.

# Write a method that takes a time using this minute-based format and returns
# the time of day in 24 hour format (hh:mm). Your method should work with any
# integer input.

# def time_of_day(int)
#   min = (int % 60).to_s # Gives us the minutes, easy-peasy
#   hrs = int / 60
#   hrs = (hrs % 24).to_s # Gives us the hour
#
#   # To ensure we have two digits
#   min.prepend('0') if min.size == 1
#   hrs.prepend('0') if hrs.size == 1
#
#   # Return this
#   "#{hrs}:#{min}"
# end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# How would you approach this problem if you were allowed to use ruby's Date
# and Time classes? Suppose you also needed to consider the day of week?
# (Assume that delta_minutes is the number of minutes before or after midnight
# between Saturday and Sunday; in such a method, a delta_minutes value of -4231
# would need to produce a return value of Thursday 01:29.)

# This is the seconds since the epoch for New Years Day 2017, a Sunday
# BASE_DATE_SEC = 1483239600
#
# def day_time?(delta_minutes)
#   delta_seconds = delta_minutes * 60
#   day_time = Time.at(BASE_DATE_SEC + delta_seconds)
#   day_time.strftime('%A %H:%M')
# end
#
# p day_time?(-4231)
# p day_time?(0)

# Write two methods that each take a time of day in 24 hour format, and return
# the number of minutes before and after midnight, respectively. Both methods
# should return a value in the range 0..1439.

# def after_midnight(string)
#   # Convert and compute hours and minutes
#   hr_in_min = string[0, 2].to_i * 60
#   min = string[3, 2].to_i
#   # To catch the edge case of '24:00'
#   hr_in_min = 0 if string[0, 2] == '24'
#   # Return total minutes since midnight
#   hr_in_min + min
# end
#
# def before_midnight(string)
#   mins = 1440 - after_midnight(string)
#   # Again, catching edge case because '00:00' == '24:00'
#   mins > 1439 ? 0 : mins
# end
#
# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# Given a string of words separated by spaces, write a method that takes this
# string of words and returns a string in which the first and last letters of
# every word are swapped.

# def swap(string)
#   arr = string.split.map! do |word|
#     first, last = word[0], word[-1]
#     word[0], word[-1] = last, first
#     word
#   end
# arr.join(' ')
# end
#
# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# With regexp
# def cleanup(string)
#   string.gsub(/[^a-z]/, ' ').tr_s(' ', ' ')
# end
#
# # Without regexp
# def cleanup(string)
#   new_str = ''
#   alphabet = ('a'..'z').to_a
#   string.each_char do |chr|
#     if alphabet.include? chr
#       new_str << chr
#     else
#       new_str << ' '
#     end
#   end
#   new_str.tr_s(' ', ' ')
# end
#
# def cleanup(string)
#   string.tr('^a-z', ' ').tr_s(' ', ' ')
# end
#
# p cleanup("---what's my +*& line?") == ' what s my line '

# Write a method that takes a string with one or more space separated words and
# returns a hash that shows the number of words of different sizes.
# Words consist of any string of characters that do not include a space.

# def word_sizes(string)
#   # String to array of integer counts of each element's characters
#   num_arr = string.split.map { |e| e.tr('^a-zA-z', '').size }
#   # Getting rid of repeated numbers
#   uniq_num_arr = num_arr.uniq
#   # Array of how many times each number occurs in num_arr
#   tally_arr = uniq_num_arr.map { |e| num_arr.count(e) }
#   # Return hash from nested arrays
#   uniq_num_arr.zip(tally_arr).to_h
# end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p word_sizes('') == {}

# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

# NUM_ARR = ["zero", "one", "two", "three", "four", "five", "six", "seven",
#   "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen",
#   "sixteen", "seventeen", "eighteen", "nineteen"]
#
# def alphabetic_number_sort(array)
#   NUM_ARR[array.first..array.last].sort.map { |x| NUM_ARR.index x }
# end

# p alphabetic_number_sort((0..19).to_a) == [
#   8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
#   6, 16, 10, 13, 3, 12, 2, 0
# ]

# Write a method that takes a string argument and returns a new string that
# contains the value of the original string with all consecutive duplicate
# characters collapsed into a single character. You may not use String#squeeze
# or String#squeeze!.

# def crunch(string)
#   new_str = ''
#   counter = 0
#   loop do
#     break if counter == string.size
#
#     if string[counter] != string[counter + 1]
#       new_str << string[counter]
#     end
#     counter += 1
#   end
#   new_str
# end
#
# def crunch(string)
#   string.chars.reduce do |memo, char|
#     last = memo
#     if last.slice(-1) != char
#       memo << char
#     end
#   end
# end
#
#
# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

def long_txt(string, width)
  line_start = 0

  loop do
    text = string[line_start, width]
    puts '| ' + text.ljust(width) + ' |'
    line_start += width
    break if line_start > string.size + 1
  end
end

def print_in_box(str, max_width = 76)
  str_width = str[0, max_width].size

  puts "+-" + ''.ljust(str_width, '-') + "-+"
  puts "| " + ''.ljust(str_width, ' ') + " |"
  if str.size < max_width
    puts '| ' + str + ' |'
  else
    long_txt(str, max_width)
  end
  puts "| " + ''.ljust(str_width, ' ') + " |"
  puts "+-" + ''.ljust(str_width, '-') + "-+"
end

print_in_box('')
print_in_box('To boldly go where no one has gone before.')
print_in_box("To be, or not to be, that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune, Or to take arms against a sea of troubles And by opposing end them.")





































































































#
