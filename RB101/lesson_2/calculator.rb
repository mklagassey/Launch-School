# ask the user for two numbers
# ask the user for an operation to perform
# perform the requested operation
# output result
require "pry"
require 'yaml'
MESSAGES = YAML.load_file('calc_messages.yml')
# binding.pry

# Add an arrow to messages
def prompt(message)
  Kernel.puts "=> #{message}"
end

# Checks input numbers
def valid_number?(num)
  num.start_with?(num.to_i.to_s)
end

# Sets input numbers to float or integer for calculation
def number?(num)
  num.include?('.') ? num.to_f : num.to_i
end

# Feedback so user knows what operation will happen
def operation_to_msg(op, message_lang)
  case op
  when '1'
    MESSAGES[message_lang]['add']
  when '2'
    MESSAGES[message_lang]['sub']
  when '3'
    MESSAGES[message_lang]['mult']
  when '4'
    MESSAGES[message_lang]['div']
  end
end

Kernel.puts "Please choose your language: 1) English 2) Español"
lang = ''
message_lang = ''
loop do
  lang = Kernel.gets().chomp()
  if lang.empty?() || !(lang.include?('1') || lang.include?('2'))
    prompt "Please enter '1' for English or '2' for Español"
  elsif lang == '1'
    message_lang = 'english'
    break
  elsif lang == '2'
    message_lang = 'spanish'
    break
  end
end

Kernel.puts MESSAGES[message_lang]['welcome']

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt MESSAGES[message_lang]['name_error']
  else
    break
  end
end

prompt MESSAGES[message_lang]['greet'] + name + '!'

loop do # Main loop
  # ask the user for two numbers
  number1 = ''
  loop do
    prompt MESSAGES[message_lang]['first_num']
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt MESSAGES[message_lang]['num_error']
    end
  end

  number2 = ''
  loop do
    prompt MESSAGES[message_lang]['second_num']
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt MESSAGES[message_lang]['num_error']
    end
  end

  # ask the user for an operation to perform

  prompt MESSAGES[message_lang]['operator_prompt']
  operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt MESSAGES[message_lang]['oper_error']
    end
  end
  # Give feedback to user on operation being performed
  prompt("#{operation_to_msg(operator, message_lang)}
  #{MESSAGES[message_lang]['op_feedback']}")

  # perform the requested operation
  result = case operator
           when '1'
             number?(number1) + number?(number2)
           when '2'
             number?(number1) - number?(number2)
           when '3'
             number?(number1) * number?(number2)
           when '4'
             number?(number1) / number?(number2)
           end

  # output result
  prompt "#{MESSAGES[message_lang]['result']} #{result}"
  prompt MESSAGES[message_lang]['redo']
  answer = gets.chomp.downcase
  break unless answer.start_with?('y', 's')
end

Kernel.puts("#{MESSAGES[message_lang]['outro']} #{name}!")
