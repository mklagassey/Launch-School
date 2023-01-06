require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

SCORE_TO_WIN = 5

INPUT_CHOICE_ALIASES = {
  rock: ['rock', 'r'],
  paper: ['paper', 'p'],
  scissors: ['scissors', 'sc'],
  spock: ['spock', 'sp'],
  lizard: ['lizard', 'l']
}

# Key choice wins against values in array
WIN_STATES = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['spock', 'rock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['spock', 'paper']
}

AVAILABLE_LANGUAGES = {
  english: 1,
  spanish: 2
}

scores = {
  player: 0,
  computer: 0
}

# Prettier prompt
def prompt(message)
  puts "=> #{message}"
end

# Get preferred language and check validity
def set_msg_lang
  case user_lang
  when 1
    'english'
  when 2
    'spanish'
  end
end

def user_lang
  puts MESSAGES['setup']['choose_lang']
  loop do
    input = gets.to_i
    if AVAILABLE_LANGUAGES.values.include?(input)
      return input
    else
      prompt MESSAGES['setup']['lang_error']
    end
  end
end

# Get user's name and check validity
def retrieve_user_name(lang)
  puts MESSAGES[lang]['welcome']
  name = gets.chomp.capitalize
  validate_name(name, lang)
end

def validate_name(input_name, lang)
  loop do
    if input_name.empty?() || input_name.start_with?(' ')
      prompt MESSAGES[lang]['name_error']
      input_name = gets.chomp.capitalize
    else
      prompt MESSAGES[lang]['greeting'] + input_name + "!"
      return input_name
    end
  end
end

# Standardize player and computer choice outputs
def alias_convert(input)
  if INPUT_CHOICE_ALIASES[:rock].include?(input)
    'rock'
  elsif INPUT_CHOICE_ALIASES[:paper].include?(input)
    'paper'
  elsif INPUT_CHOICE_ALIASES[:scissors].include?(input)
    'scissors'
  elsif INPUT_CHOICE_ALIASES[:spock].include?(input)
    'spock'
  elsif INPUT_CHOICE_ALIASES[:lizard].include?(input)
    'lizard'
  end
end

# Does the first input beat the second?
def win?(input1, input2)
  WIN_STATES[input1].include?(input2)
end

# Match outcome feedback
def win_lose_draw(player, computer, lang)
  if win?(player, computer)
    puts MESSAGES[lang]['win']
  elsif player == computer
    puts MESSAGES[lang]['draw']
  else
    puts MESSAGES[lang]['lose']
  end
end

# Updates player and computer scores
def update_score(player, comp, scores)
  if win?(player, comp) then scores[:player] += 1 end
  if win?(comp, player) then scores[:computer] += 1 end
end

# Check if someone won
def winner?(player, computer, lang)
  if player == SCORE_TO_WIN
    prompt MESSAGES[lang]['champion']
    true
  elsif computer == SCORE_TO_WIN
    prompt MESSAGES[lang]['loser']
    true
  else
    false
  end
end

# Replay?
def match_ended?(lang)
  prompt MESSAGES[lang]['play_again']
  answer = gets.chomp.downcase
  valid_input?(answer, lang)
end

def valid_input?(answer, lang)
  loop do
    if ['yes', 'y', 'sí', 's'].include?(answer)
      return true
    elsif ['no', 'n'].include?(answer)
      return false
    else
      prompt MESSAGES[lang]['yes_no_error']
      answer = gets.chomp.downcase
    end
  end
end

system 'clear'
# Sets global language preference
message_lang = set_msg_lang

# Intro and personalization
name = retrieve_user_name(message_lang)

# Main loop
loop do
  scores[:player] = 0
  scores[:computer] = 0
  # Game loop
  loop do
    player_choice = nil
    loop do # Get player choice, check validity and convert alias
      puts MESSAGES[message_lang]['player_choice_prompt']
      player_choice = gets.chomp.downcase
      if INPUT_CHOICE_ALIASES.values.flatten.include?(player_choice)
        player_choice = alias_convert(player_choice)
        break
      else
        prompt "#{player_choice} #{MESSAGES[message_lang]['player_error']}"
      end
    end
    system 'clear'
    # Computer choice and convert alias
    computer_choice = INPUT_CHOICE_ALIASES.values.flatten.sample
    computer_choice = alias_convert(computer_choice)
    # Feedback on choices
    puts "#{MESSAGES[message_lang]['player_chose']} #{player_choice} &
    #{MESSAGES[message_lang]['comp_chose']} #{computer_choice}"
    # Game logic call
    win_lose_draw(player_choice, computer_choice, message_lang)
    # Score counter increment
    update_score(player_choice, computer_choice, scores)
    # Score recap
    prompt MESSAGES[message_lang]['player_score'] + scores[:player].to_s
    prompt MESSAGES[message_lang]['comp_score'] + scores[:computer].to_s
    # Game win/lose messages
    winner?(scores[:player], scores[:computer], message_lang) ? break : next
  end
  # Check for replay request
  match_ended?(message_lang) ? next : break
end

# Outro
prompt "#{MESSAGES[message_lang]['outro']} #{name}!"
