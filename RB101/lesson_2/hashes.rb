# Create a hash that contains the following data and assign it to a variable named car.

# type 	color 	mileage
# sedan 	blue 	80_000

# car = {"type" => "sedan", "color" => "blue", "mileage" => 80_000}
#
# p car

# Using the code below, add the key :year and the value 2003 to car.

# car = {
#   type:    'sedan',
#   color:   'blue',
#   mileage: 80_000
# }
#
# car.merge!({year: 2003})
#
# p car

# Using the following code, delete the key :mileage and its associated value from car.

# car = {
#   type:    'sedan',
#   color:   'blue',
#   mileage: 80_000,
#   year:    2003
# }
#
# car.delete :mileage
#
# p car

# Using the following code, select the value 'blue' from car and print it with #puts.

# car = {
#   type:    'sedan',
#   color:   'blue',
#   year:    2003
# }
#
# puts car[:color]

# Use Hash#each to iterate over numbers and print each element's key/value pair.

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# numbers.each { |k, v| puts "A #{k} number is #{v}."  }

# Use Enumerable#map to iterate over numbers and return an array containing each number divided by 2. Assign the returned array to a variable named half_numbers and print its value using #p.

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# half_numbers = numbers.map { |k, v| v / 2 }
#
# p half_numbers

# Use Hash#select to iterate over numbers and return a hash containing only key-value pairs where the value is less than 25. Assign the returned hash to a variable named low_numbers and print its value using #p.

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# low_numbers = numbers.select { |k, v| v < 25 }
#
# p low_numbers

# In the following code, numbers isn't mutated because #select isn't a destructive method. However, there is a destructive version of #select named #select!. Modify the code to use #select! instead of #select.

# numbers = {
#   high:   100,
#   medium: 50,
#   low:    10
# }
#
# low_numbers = numbers.select! do |key, value|
#                  value < 25
#                end
#
# p low_numbers
# p numbers

# Create a nested hash using the following data.

# Car
# type 	color 	year
# sedan 	blue 	2003
#
# Truck
# type 	color 	year
# pickup 	red

# vehicles = {
#   Car: {type: "sedan", color: "blue", year: 2003},
#   Truck: {type: "pickup", color: "red", year:nil}
# }
#
# p vehicles

# Rewrite car as a nested array containing the same key-value pairs.

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

car = car.to_a

p car




































#
