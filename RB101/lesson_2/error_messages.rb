# You come across the following code. What errors does it raise for the given examples and what exactly do the error messages mean?

# def find_first_nonzero_among(numbers)
#   numbers.each do |n|
#     return n if n.nonzero?
#   end
# end
#
# # Examples
# p find_first_nonzero_among([0, 0, 1, 0, 2, 0]) # wrong number of arguments
# p find_first_nonzero_among([1]) # undefined method `each' for 1:Integer

# Our predict_weather method should output a message indicating whether a sunny or cloudy day lies ahead. However, the output is the same every time the method is invoked. Why? Fix the code so that it behaves as expected.

# def predict_weather
#   sunshine = [true, false].sample
#
#   if sunshine
#     puts "Today's weather will be sunny!"
#   else
#     puts "Today's weather will be cloudy!"
#   end
# end
#
# predict_weather

# When the user inputs 10, we expect the program to print The result is 50!, but that's not the output we see. Why not?

# def multiply_by_five(n)
#   n * 5
# end
#
# puts "Hello! Which number would you like to multiply by 5?"
# number = gets.chomp.to_i
#
# puts "The result is #{multiply_by_five(number)}!"

# Magdalena has just adopted a new pet! She wants to add her new dog, Bowser, to the pets hash. After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed. Help Magdalena fix her code so that all three of her dogs' names will be associated with the key :dog in the pets hash.

# pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }
#
# pets[:dog] << 'bowser'
#
# p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

# We want to iterate through the numbers array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?

# numbers = [5, 2, 9, 6, 3, 1, 8]
#
# even_numbers = numbers.select do |n|
#   n if n.even?
# end
#
# p even_numbers # expected output: [2, 6, 8]

# You want to have a small script delivering motivational quotes, but with the following code you run into a very common error message: no implicit conversion of nil into String (TypeError). What is the problem and how can you fix it?

# def get_quote(person)
#   case person
#   when 'Yoda'
#     'Do. Or do not. There is no try.'
#   when 'Confucius'
#     'I hear and I forget. I see and I remember. I do and I understand.'
#   when 'Einstein'
#     'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
#   end
# end
#
# puts 'Confucius says:'
# puts '"' + get_quote('Confucius') + '"'

# The output of the code below tells you that you have around $70. However, you expected your bank account to have about $238. What did we do wrong?

# Financially, you started the year with a clean slate.

# balance = 0
#
# # Here's what you earned and spent during the first three months.
#
# january = {
#   income: [ 1200, 75 ],
#   expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
# }
#
# february = {
#   income: [ 1200 ],
#   expenses: [ 650, 140, 320, 46.7, 122.5 ]
# }
#
# march = {
#   income: [ 1200, 10, 75 ],
#   expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
# }
#
# # Let's see how much you've got now...
#
# def calculate_balance(month)
#   plus  = month[:income].sum
#   minus = month[:expenses].sum
#
#   plus - minus
# end
#
# [january, february, march].each do |month|
#   balance += calculate_balance(month)
# end
#
# puts balance

# The following code throws an error. Find out what is wrong and think about how you would fix it.

# colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
# things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']
#
# colors.shuffle!
# things.shuffle!
#
# i = 0
# loop do
#   break if i >= colors.length || i >= things.length
#
#   if i == 0
#     puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
#   else
#     puts 'And a ' + colors[i] + ' ' + things[i] + '.'
#   end
#
#   i += 1
# end

# When testing the method, you are surprised by a return value of 0. What's wrong with this code and how can you fix it?

# def digit_product(str_num)
#   digits = str_num.chars.map { |n| n.to_i }
#   product = 1
#
#   digits.each do |digit|
#     product *= digit
#   end
#
#   product
# end
#
#
# p digit_product('12345')
# expected return value: 120
# actual return value: 0

# We started writing an RPG game, but we have already run into an error message. Find the problem and fix it.

# Each player starts with the same basic stats.

# player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

# character_classes = {
#   warrior: { strength:  20 },
#   thief:   { dexterity: 20 },
#   scout:   { stamina:   20 },
#   mage:    { charisma:  20 }
# }
#
# puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase.to_sym
# p character_classes[input]
#
# player.merge!(character_classes[input])
#
# puts 'Your character stats:'
# puts player
a = [1, 4, 8, 11, 15, 19]

p a.bsearch{|x| x > 8}



































#
