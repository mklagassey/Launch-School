require 'pry'

loop do # Main loop
  # Init input variables
  amt = nil
  apr = nil
  loan_yrs = nil
  # Get 3 inputs from user
  loop do
    puts "How much did you borrow (rounded to nearest dollar)?"
    amt = gets.tr('$,.', '').to_i
    if amt <= 0
      puts "Amount must be a whole number greater than zero!"
    else
      break
    end
  end

  loop do
    puts "What was your APR?"
    apr = gets.to_f
    if apr <= 0
      puts "Rate must be greater than zero!"
    else
      break
    end
  end

  loop do
    puts "And lastly, how many years is your loan for?"
    loan_yrs = gets.to_f
    if loan_yrs < 1
      puts "Loan duration cannot be less than 1 year!"
    else
      break
    end
  end

  # Assign inputs to output variables
  # Perform calculations on inputs
  mo_int_rate = ((apr * 0.01) / 12)
  loan_mos = loan_yrs * 12
  mo_pay = (amt * (mo_int_rate / (1 - (1 + mo_int_rate)**(-loan_mos)))).round(2)

  # Print outputs for user
  puts <<-OUT
  Your monthly interest rate is: #{(mo_int_rate * 100).round(2)}%
  The duration of your loan is: #{loan_mos} months.
  Your monthly payment will be: $#{mo_pay}
  OUT
  # Do main loop again?
  puts "Would you like to do another calculation? Y/N"
  gets.downcase.start_with?('y') ? next : break
end

puts "Thanks for using the loan calculator!"
