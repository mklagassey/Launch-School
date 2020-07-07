# Still reviewing!

# count = 1
#
# loop do
#   puts count.odd? ? "#{count} is odd!" : "#{count} is even!"
#   count += 1
#   break if count > 5
# end

# loop do
#   number = rand(100)
#   puts number
#   break if number >= 0 && number <= 10
# end

# process_the_loop = [true, false].sample
#
# loop do
#   if process_the_loop == true
#     puts "The loop was processed!"
#     break
#   else
#     puts "The loop wasn't processed!"
#     break
#   end
# end
#
# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#   if answer == 4
#     puts "That's correct!"
#     break
#   else
#     puts "Wrong answer. Try again!"
#   end
# end

# numbers = []
#
# loop do
#   puts 'Enter any number:'
#   numbers << gets.chomp.to_i
#   break if numbers.size == 5
# end
# puts numbers

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# loop do
#   puts names.shift
#   break if names.empty?
# end

# 5.times do |index|
#   puts index
#   break if index == 2
# end

# number = 0
#
# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

# number_a = 0
# number_b = 0
#
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a == 5 || number_b == 5
#   puts "5 was reached!"
#   break
# end

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end





































































































#
