# Select 'fish' from pets, assign the return value to a variable named my_pet, then print the value of my_pet.
# pets = ['cat', 'dog', 'fish', 'lizard']

# my_pet = pets[2]
# puts "I have a pet #{my_pet}!"

# Write some code that selects 'fish' and 'lizard' from the pets array - select the two items at the same time. Assign the return value to a variable named my_pets, then print the contents of my_pets as a single string
# my_pet = pets[2,3]

# puts "I have a pet #{my_pet[0]} and a pet #{my_pet[1]}!"

# Remove 'lizard' from my_pets then print the value of my_pets.
# my_pet.pop
# my_pet.delete "lizard"
# puts "I have a pet #{my_pet[0]}!"

# Without changing the code below, select 'dog' from pets, add the return value to my_pets, then print the value of my_pets.

# pets = ['cat', 'dog', 'fish', 'lizard']
# my_pets = pets[2..3]
# my_pets.pop
#
# my_pets << pets[1]
#
# puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

# Use Array#each to iterate over colors and print each element.
# colors = ['red', 'yellow', 'purple', 'green']
#
# colors.each { |color| puts "I'm the color #{color}!" }

# Use Array#map to iterate over numbers and return a new array with each number doubled. Assign the returned array to a variable named doubled_numbers and print its value using #p.
# numbers = [1, 2, 3, 4, 5]
#
# doubled_numbers = numbers.map { |num| num * 2 }
#
# p doubled_numbers


# Use Array#select to iterate over numbers and return a new array that contains only numbers divisible by three. Assign the returned array to a variable named divisible_by_three and print its value using #p.
# numbers = [5, 9, 21, 26, 39]
#
# divisible_by_three = numbers.select { |num| num % 3 == 0}
#
# p divisible_by_three

# The following array contains three names and numbers. Group each name with the number following it by placing the pair in their own array. Then create a nested array containing all three groups. What does this look like? (You don't need to write any code here. Just alter the value shown so it meets the exercise requirements.)

# arr = ['Dave', 7, 'Miranda', 3, 'Jason', 11]
# name_index = 0
# new_arr = []
#
# loop do
#   break if name_index == arr.size
#   name, number = arr[name_index], arr[name_index + 1]
#   new_element = [name, number]
#   new_arr << new_element
#   name_index += 2
# end

# We want => [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
# p new_arr

# Flatten and print this array. That is, the printed result should not have any subarrays, but should have all of the original strings and numbers from the original array:

# favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
#
# p favorites.flatten

# Compare array1 and array2 and print true or false based on whether they match.

array1 = [1, 5, 9]
array2 = [1, 9, 5]

p array1 == array2

































#
