
    # asks for two numbers
    # asks for the type of operation to perform: add, subtract, multiply or divide
    # displays the result

# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().
puts "What is your first number?"
first_num = gets.chomp
puts "What is your second number?"
second_num = gets.chomp
puts "What do you want to do with those numbers? Press 1 to add, 2 to subtract, 3 to multiply and 4 to divide."
op = gets.to_i

case op
when 1
   result = first_num.to_i + second_num.to_i
when 2
  result = first_num.to_i - second_num.to_i
when 3
  result = first_num.to_i * second_num.to_i
when 4
  result = first_num.to_f / second_num.to_f
else
  puts "I'm sorry, that operation is not recognized. Goodbye!"
  return
end

puts "Your answer is: #{result}"
