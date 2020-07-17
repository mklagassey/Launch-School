# How would you order this array of number strings by descending numeric value?

# arr = ['10', '11', '9', '7', '8']
#
# p arr.sort_by { |elem| elem.to_i }.reverse
#
# p arr.sort { |elemA, elemB| elemB.to_i <=> elemA.to_i }

# How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?

# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysses', author: 'James Joyce', published: '1922'}
# ]
#
# puts books.sort_by { |hash|
#   hash[:published].to_i
# }

# For each of these collection objects demonstrate how you would reference the
# letter 'g'.

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
# p arr1[2][1][3]
#
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
# p arr2[1][:third][0]
#
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
# p arr3[2][:third][0][0]
#
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
# p hsh1['b'][1]
#
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
# p hsh2[:third].keys[0]

# For each of these collection objects where the value 3 occurs, demonstrate
# how you would change this to 4.

# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4
# p arr1
#
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4
# p arr2
#
# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4
# p hsh1
#
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4
# p hsh2

# figure out the total age of just the male members of the family.

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }

# males = munsters.select { |munster, stats|
#   stats['gender'] == 'male'
# }
# male_ages = males.map { |_, v| v['age'] }.sum
# p male_ages

# Given this previously seen family hash, print out the name, age and gender of
# each family member:

# munsters.each { |name, stats|
# puts "#{name} is a #{stats['age']}-year-old #{stats['gender']}."
# }

# Using the each method, write some code to output all of the vowels from the
# strings.

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'],
#   fourth: ['over', 'the', 'lazy', 'dog']}
#
# hsh.each { |_, v|
#   v.each {|word| word.scan(/[aeiou]/) { |match| p match  } }
# }

# Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate)
# in descending order.

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#
# p arr.map { |elem|
#   elem.sort { |a, b| b <=> a }
# }

# Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the
# original but where the value of each integer is incremented by 1.

# arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#
# plus = arr.map do |elem|
#   elem.map { |key, value| [key, value += 1]  }.to_h
# end
#
# p plus

# Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in
# structure to the original but containing only the integers that are multiples
# of 3.

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
# p arr.map { |sub_arr|
#   sub_arr.select { |int| int % 3 == 0  }
# }

# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in
# each sub array and the value is the second item. Like this:
# {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
#
# p arr.each_with_object({}) { |sub_arr, hash|
#   hash[sub_arr[0]] = sub_arr[1]
# }

# Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into
# consideration the odd numbers they contain. Like this:
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

# arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
#
# p arr.sort_by { |sub_arr| sub_arr.select { |x| x.odd? }}

# Given this data structure write some code to return an array containing the
# colors of the fruits and the sizes of the vegetables. The sizes should be
# uppercase and the colors should be capitalized. Like this:
# [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
#
# arr = []
#
# hsh.each do |_, v|
#   if v[:type] == 'fruit'
#     arr << v[:colors].map { |e| e.capitalize  }
#   elsif v[:type] == 'vegetable'
#     arr << v[:size].upcase
#   end
# end
# p arr

# Given this data structure write some code to return an array which contains
# only the hashes where all the integers are even.

# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#
# arr.select do |hash|
#   hash.all? do |_, value|
#     value.all? { |int| int.even? }
#   end
# end

# Write a method that returns one UUID when called with no parameters.
# Each UUID consists of 32 hexadecimal characters, and is typically broken into
# 5 sections like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

# HEX = [0,1,2,3,4,5,6,7,8,9,'a','b','c','d','e','f']
#
# def homemade_uuid
#   dash = 8,13,18,23
#
#   arr = (0..35).map do |index|
#     if dash.include?(index)
#       '-'
#     else
#       HEX.sample
#     end
#   end
#   arr.join
# end
#
# def secure_uuid
#   require 'securerandom'
#   SecureRandom.uuid
# end
#
# p homemade_uuid
# p secure_uuid



























#
