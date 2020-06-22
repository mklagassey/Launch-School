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
  choice = nil
  loop do # Get player choice, check validity and convert alias
    prompt MESSAGES[message_lang]['player_choice_prompt']
    choice = gets.chomp.downcase

    if INPUT_CHOICE_ALIASES.flatten.include?(choice)
      choice = alias_convert(choice)
      break
    else
      prompt "#{choice} #{MESSAGES[message_lang]['player_choice_error']}"
    end
  end
  # Computer choice and convert alias
  computer_choice = INPUT_CHOICE_ALIASES.flatten.sample
  computer_choice = alias_convert(computer_choice)
  # Feedback on both choices and outcome
  # binding.pry
  puts "#{MESSAGES[message_lang]['player_chose']} #{choice} &
  #{MESSAGES[message_lang]['comp_chose']} #{computer_choice}"
  win_lose_draw(choice, computer_choice, message_lang) # Game logic call
  if win?(choice, computer_choice) then player_score += 1 end
  if win?(computer_choice, choice) then comp_score += 1 end
  prompt MESSAGES[message_lang]['player_score'] + player_score.to_s
  prompt MESSAGES[message_lang]['comp_score'] + comp_score.to_s
  if player_score > 4
    prompt MESSAGES[message_lang]['champion']
    break
  elsif comp_score > 4
    prompt MESSAGES[message_lang['loser']]
    break
  end
  # Replay option
  prompt MESSAGES[message_lang]['play_again']
  break unless gets.downcase.start_with?('y', 's')
end

# Outro
prompt "#{MESSAGES[message_lang]['outro']} #{name}!"
