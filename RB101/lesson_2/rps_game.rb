# require "pry"
require 'yaml'
MESSAGES = YAML.load_file('rps_messages.yml')

INPUT_CHOICE_ALIASES = [
  ['rock', 'r'],
  ['paper', 'p'],
  ['scissors', 'sc'],
  ['spock', 'sp'],
  ['lizard', 'l']
]

# Key choice wins against values in array
WIN_STATES = {
  'rock' => ['lizard', 'scissors'],
  'paper' => ['spock', 'rock'],
  'scissors' => ['paper', 'lizard'],
  'spock' => ['rock', 'scissors'],
  'lizard' => ['spock', 'paper']
}

def alias_convert(input)
  if INPUT_CHOICE_ALIASES[0].to_s.include?(input)
    'rock'
  elsif INPUT_CHOICE_ALIASES[1].to_s.include?(input)
    'paper'
  elsif INPUT_CHOICE_ALIASES[2].to_s.include?(input)
    'scissors'
  elsif INPUT_CHOICE_ALIASES[3].to_s.include?(input)
    'spock'
  elsif INPUT_CHOICE_ALIASES[4].to_s.include?(input)
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

def prompt(message)
  puts "=> #{message}"
end

# Sets global language preference
puts MESSAGES['setup']['choose_lang']

lang = ''
message_lang = ''

loop do
  lang = gets.chomp
  case lang
  when '1'
    message_lang = 'english'
    break
  when '2'
    message_lang = 'spanish'
    break
  else
    prompt "Please enter '1' for English o '2' para Español"
  end
end

# Intro and personalization
puts MESSAGES[message_lang]['welcome']

name = nil
loop do
  name = gets.chomp.capitalize
  if name.empty?()
    prompt MESSAGES[message_lang]['name_error']
  else
    prompt MESSAGES[message_lang]['greeting'] + name + "!"
    break
  end
end

player_score = 0
comp_score = 0
# Main loop
loop do
  player_choice = nil
  endgame = false
  loop do # Get player choice, check validity and convert alias
    prompt MESSAGES[message_lang]['player_choice_prompt']
    player_choice = gets.chomp.downcase

    if INPUT_CHOICE_ALIASES.flatten.include?(player_choice)
      player_choice = alias_convert(player_choice)
      break
    else
      prompt "#{player_choice} #{MESSAGES[message_lang]['player_choice_error']}"
    end
  end
  # Computer choice and convert alias
  computer_choice = INPUT_CHOICE_ALIASES.flatten.sample
  computer_choice = alias_convert(computer_choice)
  # Feedback on both choices and outcome
  # binding.pry
  puts "#{MESSAGES[message_lang]['player_chose']} #{player_choice} &
  #{MESSAGES[message_lang]['comp_chose']} #{computer_choice}"
  # Game logic call
  win_lose_draw(player_choice, computer_choice, message_lang)
  # Round recap
  if win?(player_choice, computer_choice) then player_score += 1 end
  if win?(computer_choice, player_choice) then comp_score += 1 end
  # Running score
  prompt MESSAGES[message_lang]['player_score'] + player_score.to_s
  prompt MESSAGES[message_lang]['comp_score'] + comp_score.to_s
  # Game win messages
  if player_score > 4
    prompt MESSAGES[message_lang]['champion']
    endgame = true
  elsif comp_score > 4
    prompt MESSAGES[message_lang['loser']]
    endgame = true
  end
  # Replay option
  if endgame == true
    player_score = 0
    comp_score = 0
    prompt MESSAGES[message_lang]['play_again']
    break unless gets.downcase.start_with?('y', 's')
  end
end

# Outro
prompt "#{MESSAGES[message_lang]['outro']} #{name}!"
