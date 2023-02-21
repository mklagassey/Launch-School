def prompt(msg)
  puts "=> #{msg}"
end

prompt "Welcome to Calc-U-Loan, calculating your loans since today!"

loop do
  prompt "How much are you financing in USD?"
  loan_amt = gets.chomp.to_f
  prompt "What is your expected annual percentage rate (APR)?"
  apr = gets.chomp.to_f
  prompt "How many years is your loan for?"
  loan_years = gets.chomp.to_f

  monthly_interest_rate = (apr / 100) / 12
  loan_months = loan_years * 12
  monthly_payment = (loan_amt * (monthly_interest_rate / (1 -
    (1 + monthly_interest_rate)**(-loan_months)))).round(2)
  payment_total = loan_months * monthly_payment

  prompt("With an APR of #{apr}% and loan duration of #{loan_years} years,
    financing $#{loan_amt} will require a monthly payment of
    $#{monthly_payment}. Your total payment (loan amount + interest) will
    be $#{payment_total}.")

  prompt "Would you like to calculate another loan?"
  continue = gets.chomp
  break if !continue.start_with?("y", "Y")
end

prompt "Thanks for using the \#1 free loan calculator!"
