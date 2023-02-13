
    # asks for two numbers
    # asks for the type of operation to perform: add, subtract, multiply or divide
    # displays the result

# Use the Kernel.gets() method to retrieve user input, and use Kernel.puts() method to display output. Remember that Kernel.gets() includes the newline, so you have to call chomp() to remove it: Kernel.gets().chomp().
def prompt(msg)
  puts "=> #{msg}"
end

def valid_num(num)
  num.to_i != 0
end

def valid_op(op)
  [1,2,3,4].include?(op)
end

def op_to_msg(op)
  case op
  when 1
    'Adding'
  when 2
    "Subtracting"
  when 3
    "Multiplying"
  when 4
    "Dividing"
  end
end

prompt "Welcome to calculator!"
# Main loop
loop do
  # Setup questions
  first_num = ''
  loop do
    prompt("What is your first number?")
    first_num = gets.chomp
    if valid_num(first_num)
      break
    else
      prompt "Noooope, try again!"
    end
  end

  second_num = ''
  loop do
    prompt("What is your second number?")
    second_num = gets.chomp
    if valid_num(second_num)
      break
    else
      prompt "Noooope, try again!"
    end
  end

  op_prompt = <<-MSG
    What do you want to do with those numbers?
      Press 1 to add
            2 to subtract
            3 to multiply
            4 to divide
  MSG
  prompt(op_prompt)

  op = ''
  loop do
    op = gets.to_i
    if valid_op(op)
      break
    else
      prompt "Noooope, try again!"
    end
  end

  prompt "#{op_to_msg(op)} your numbers!"

  case op
  when 1
     result = first_num.to_i + second_num.to_i
  when 2
    result = first_num.to_i - second_num.to_i
  when 3
    result = first_num.to_i * second_num.to_i
  when 4
    result = first_num.to_f / second_num.to_f
  end

  prompt("Your answer is: #{result}")

  prompt "Would you like to perform another operation?"
  continue = gets.chomp
  break if !continue.start_with?("y", "Y")
end

prompt "Thanks for using the calculator, come back soon!"
