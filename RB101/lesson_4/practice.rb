# Additional practice problems

# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Using built-in methods

# p flintstones.zip(0..flintstones.size).to_h
# p flintstones

# Using loops

# counter = 0
# hash = {}
#
# loop do
#   break if counter == flintstones.size
#
#   hash[flintstones[counter]] = counter
#
#   counter += 1
# end
# p hash

# Add up all of the ages from the Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#   "Marilyn" => 22, "Spot" => 237 }
#
# # Using built-in methods
#
# p ages.values.sum
#
# # Using loops
#
# counter = 0
# total = 0
# ages_keys = ages.keys
#
# loop do
#   break if counter == ages.size
#
#   total += ages[ages_keys[counter]]
#
#   counter += 1
# end
#
# p total
#
# p ages

# In the age hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# # remove people with age 100 and greater.
#
# # Using built-in methods
#
# # ages = ages.select { |k, v| v < 100 }
# # ages.delete_if { |k, v| v > 100 }
#
# # Using loops
#
# counter = 0
# ages_keys = ages.keys
#
# loop do
#   break if counter == ages.size
#
#   ages.delete(ages_keys[counter]) if ages[ages_keys[counter]] > 100
#
#   counter += 1
# end
#
# p ages

# Pick out the minimum age from our current Munster family hash:

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10,
#   "Marilyn" => 22, "Spot" => 237 }
#
# # Using built-in methods
#
# # p ages.values.min
# # p ages.reduce { |memo, elem| memo[1] < elem.at(1) ? memo : elem }
#
# # Using loops
#
# counter = 0
# ages_array = ages.to_a
# lowest_age = nil
#
# loop do
#   break if ages.size == counter
#
#   current_age = ages_array[counter][1]
#
#   lowest_age = current_age if lowest_age == nil
#   lowest_age = current_age if lowest_age > current_age
#
#   counter += 1
#
# end
#
# p lowest_age

# In the array:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# # Find the index of the first name that starts with "Be"
#
# # P - return index from array with first element that matches pattern
# # Inputs: array of strings
# # Outputs: an Integer representing the index of matching string
# # Explicit: must be the first elem that matches "Be"
# # Implicit: original array not mutated
#
# # Using built-in methods
#
# p flintstones.index { |x| x =~ /Be/ }
#
# # Using loops
#
# counter = 0
# index = nil
#
# loop do
#   break if counter == flintstones.size
#
#   current_string = flintstones[counter]
#   index = counter if current_string.include? "Be"
#
#   counter += 1
#
# end
#
# p index

# Amend this array so that the names are all shortened to just the first three
# characters:

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# # P - Mutate all strings in given array to first three chars
# # Inputs: Single array of multiple strings
# # Outputs: Original array, mutated
# # Explicit: Shorten each string, in place, to first three characters
# # Implicit: No other output required
#
# # Using built-in methods
#
# # p flintstones.map! { |x| x[0..2] }
#
# # Using loops
#
# counter = 0
#
# loop do
#   break if flintstones.size == counter
#
#   current_string = flintstones[counter]
#   flintstones[counter] = current_string[0..2]
#
#   counter += 1
# end
#
# p flintstones

# Create a hash that expresses the frequency with which each letter occurs in
# this string:

statement = "The Flintstones Rock"

# P - count the times each letter happens in a given string
# Inputs: A multiple word string
# Outputs: A hash
# Explicit: Return a hash with keys representing each unique letter and
# corresponding keys representing the count
# Implicit: Case sensitive so "T" and "t" are different and counted separately
# and only letters are counted, not spaces

# Using built in methods

# p statement.gsub!(' ', '').chars.tally
#
# # Using loops
#
# hash = {}
# copy = statement.strip.delete(' ')
#
# loop do
#   tally = 1
#   comp_char = nil
#   break if copy.empty?
#   current_char = copy.slice!(0)
#   copy.each_char do |char|
#     if current_char == char
#       tally += 1
#       copy.sub!(char, '')
#     end
#     hash.store(current_char, tally)
#   end
#   hash
# end
#
# p hash

# Write your own version of the rails titleize implementation.

# P - Given a string, capitalize each word
# Inputs: A string, possibly with multiple words
# Outputs: Mutated original string
# Explicit: Take each word in string and modify the first letter to uppercase
# Implicit: Modifies original string, not a copy, keep spacing

# E - change "the flintstones rock" => "The Flintstones Rock"
# D - String
# A - Determine beginning letter of each word, change it to uppercase

# words = "the flintstones rock"
#
# # Using built in methods
#
# # words = words.split.map! { |x| x.capitalize! }.join(' ')
# # p words
#
# # Using loops
#
# counter = 0
# array = words.lines ' '
#
# loop do
#   break if counter == array.size
#
#   current_string = array[counter]
#   current_string.capitalize!
#   counter += 1
#
#   words = array.join
# end
#
# p words

# P - Given a hash, modify it to include a new key-value pair for each person with
# the key set to "age_group" and the value either "kid", "adult" or "senior"
# depending on the age.

# Inputs: A hash, using the "age" value of each person's key
# Outputs: Mutated original hash adding a new key with it's value set to one
# of three preset options
# Explicit: Add a third k,v pair to each subhash belonging to keys of 'munsters'
# the key of which will always be "age_group". Set "age_group" value to "kid" if
# "age" value is 0-17, "adult" if value is 18-64 and "senior" if value is 65+
# Implicit:

# E - "Herman" => { "age" => 32, "gender" => "male" } will be modified to:
# "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" }
# D - Hash key value pair within value of larger hash

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Group by age and assign, first attempt at method
# def assign_age_group(age, group)
#   if age < 18
#     group.replace 'kid'
#   elsif age > 64
#     group.replace 'senior'
#   else
#     group.replace 'adult'
#   end
# end

# Try using case statement and range objects
# def assign_age_group(age, group)
#   case age
#   when (0..17)
#     group.replace 'kid'
#   when (18..64)
#     group.replace 'adult'
#   when (64..)
#     group.replace 'senior'
#   end
# end
#
# # Add the 'age_group' keys, initialize values to blank string
# munsters.each { |k,v| v.update({'age_group' => ''}) }
# # Add a value to new keys according to age group assigned
# munsters.each { |k,v| assign_age_group(v['age'], v['age_group'])}
#
#
# puts munsters

sentence = 'The sky was blue'

def upper_snake(str)
  words = str.split
  current_word = 0

  loop do

    break if current_word == words.size

    words[current_word].upcase!

    current_word += 1
  end

  words.join('_')
end

p upper_snake(sentence)
















































































































































































#
