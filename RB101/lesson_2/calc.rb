# asks for two numbers
# asks for the type of operation to perform: add, subtract, multiply or divide
# displays the result
=begin
Use the Kernel.gets() method to retrieve user input, and use Kernel.puts()
method to display output.
Remember that Kernel.gets() includes the newline, so you have to call chomp() to
remove it:
Kernel.gets().chomp().
Bonus Features ---------------------------------------------------------------
1) Better integer validation.
2) Number validation.
=end
VALID_NUM_INPUTS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '-']

def prompt(msg)
  puts "=> #{msg}"
end

def valid_num(num)
  all_chars_ints = true
  num.each_char { |chr|
    if !VALID_NUM_INPUTS.include?(chr)
      all_chars_ints = false
    end
  }
  all_chars_ints
end

def valid_op(op)
  [1, 2, 3, 4].include?(op)
end

def op_to_msg(op)
  msg = ''
  case op
  when 1
    msg = 'Adding'
  when 2
    msg = "Subtracting"
  when 3
    msg = "Multiplying"
  when 4
    msg = "Dividing"
  end
  # we can add more code here if necessary
  msg
end

def div_by_zero(denom, op)
  denom == '0' && op == 4
end

prompt "Welcome to calculator, let's get to calculating!"
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
    if valid_op(op) && !div_by_zero(second_num, op)
      break
    else
      prompt "Noooope, try again!"
    end
  end

  prompt "#{op_to_msg(op)} your numbers!"

  case op
  when 1
    result = first_num.to_f + second_num.to_f
  when 2
    result = first_num.to_f - second_num.to_f
  when 3
    result = first_num.to_f * second_num.to_f
  when 4
    result = first_num.to_f / second_num.to_f
  end

  prompt("Your answer is: #{result}")

  prompt "Would you like to perform another operation?"
  continue = gets.chomp
  break if !continue.start_with?("y", "Y")
end

prompt "Thanks for using the calculator, come back soon!"
