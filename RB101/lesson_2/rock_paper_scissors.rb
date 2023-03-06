VALID_CHOICES = ["rock", "paper", "scissors"]

def computer_win?(comp, user)
  comp == "rock" && user == "scissors" ||
    comp == "scissors" && user == "paper" ||
    comp == "paper" && user == "rock"
end

def display_result(computer, user)
  if computer == user
    prompt "It's a tie!"
  elsif computer_win?(computer, user)
    prompt "You lose!"
  else
    prompt "You win!!!"
  end
end

def test_method
  prompt('test message')
end

# test_method

def prompt(msg)
  puts "=> #{msg}"
end

test_method

# Main game loop
prompt "Welcome to Rock-Paper-Scissors Showdown!"

loop do
  user_choice = ''
  loop do
    prompt "Choose one of the following: #{VALID_CHOICES.join(', ')}"
    user_choice = gets.chomp.downcase

    break if VALID_CHOICES.include? user_choice
    prompt "Not a valid choice, please try again!"
  end

  comp_choice = VALID_CHOICES.sample

  prompt "Your choice was: #{user_choice} and computer chose: #{comp_choice}"

  display_result(comp_choice, user_choice)

  prompt "Play again? (y/n)"
  play_again = gets.chomp.downcase
  break if !play_again.start_with?("y")
end

prompt "Thanks for playing, come on back real soon!"
