FIRST_TURN = ''             # Optional ability to choose default first player
BLANK_SPOT_NUMS = (1..9)    # Denotes available squares on game board
PLAYER_MARK = 'X'           # Denotes player taken squares on game board
COMP_MARK = 'O'             # Denotes computer taken squares on game board
WIN_COMBOS = [
  [1, 2, 3], [4, 5, 6], [7, 8, 9],    # Rows
  [1, 4, 7], [2, 5, 8], [3, 6, 9],    # Columns
  [1, 5, 9], [3, 5, 7]                # Diagonals
]
WELCOME_MSG = { 0 => 'Welcome to The TIC-TAC-TOE Championship!' }
MARKER_MSG = {
  0 => "Reminder: You are #{PLAYER_MARK}s and computer is #{COMP_MARK}s."
}
WIN = {
  0 => "**** Great job, keep it up! *****",
  1 => ' ',
  2 => '   ___ _      ______________  __  _________ _',
  3 => '  / _ | | /| / / __/ __/ __ \/  |/  / __/ / /',
  4 => ' / __ | |/ |/ / _/_\ \/ /_/ / /|_/ / _/  /_/ ',
  5 => '/_/ |_|__/|__/___/___/\____/_/  /_/___/ (_)  ',
  6 => '*********************************************'
}
LOSE = {
  0 => "**** Oh man, better luck next time. *****",
  1 => ' ',
  2 => '   __                                ',
  3 => '  / /  __ ____ _  __ _  ___ ____     ',
  4 => ' / _ \/ // /  \' \/  \' \/ -_) __/ _ _ ',
  5 => '/_.__/\_,_/_/_/_/_/_/_/\__/_/ (_|_|_)',
  6 => '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
}
CAT = {
  0 => "**** Well, at least you didn't lose. *****",
  1 => ' ',
  2 => '         /\_/\  ',
  3 => '    ____/ o o \ ',
  4 => '  /~____  =ø= /',
  5 => ' (______)__m_m)',
  6 => '+++++++++++++++++++'
}

# Makes the text line easier to see
def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
# Shows the game board and scores
def display_board(brd, player, comp, msg)
  system 'clear'
  puts ''
  puts msg[0]
  puts ""
  puts "       |     |               ---SCORES---   "
  puts "    #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "       |     |                PLAYER: #{player}   "
  puts "  -----+-----+-----"
  puts "       |     |                COMPUTER: #{comp}  "
  puts "    #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}     #{msg[1]}"
  puts "       |     |        #{msg[2]}"
  puts "  -----+-----+-----   #{msg[3]}"
  puts "       |     |        #{msg[4]}"
  puts "    #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}     #{msg[5]}"
  puts "       |     |        #{msg[6]}"
  puts "     "
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

# Blank board control hash, keys are positions and values are displayed
def numbered_board
  numbered_board = {}
  BLANK_SPOT_NUMS.each { |num| numbered_board[num] = num }
  numbered_board
end

def initialize_game_board
  new_board = {}
  BLANK_SPOT_NUMS.each { |num| new_board[num] = ' ' }
  new_board
end

# Who should the first player be if not already specified in constant?
def first_player(const)
  loop do
    break if first_player_set?(const)
    puts "Choose who goes first. 'Computer' or 'Player'."
    const = gets.chomp.downcase
    next if first_player_set?(const)
    puts "Sorry, '#{const}' is not an option."
  end
  const
end

# Is the first player constant already set?
def first_player_set?(const)
  const == 'player' || const == 'computer' ? true : false
end

# Makes available spot number list more readable
def joinor(brd, sep = ', ', andor = 'or ')
  if open_spots(brd).size > 1
    open_spots(brd).join(sep).insert(-2, andor)
  else
    open_spots(brd).join
  end
end

# Determine empty/taken spots on board, return as array
def open_spots(brd)
  brd.keys.select { |num| brd[num] == ' ' }
end

def player_spots(brd)
  brd.keys.select { |num| brd[num] == PLAYER_MARK }
end

def comp_spots(brd)
  brd.keys.select { |num| brd[num] == COMP_MARK }
end

def all_taken_spots(brd)
  player_spots(brd) + comp_spots(brd)
end

# Gives the player or computer their chance to move
def current_turn_choice(current, brd)
  if current == 'player'
    player_choice!(brd)
  elsif current == 'computer'
    comp_choice!(brd)
  end
end

# Player chooses position, board is modified if spot is open
def player_choice!(brd)
  square = ''
  loop do
    prompt "Please choose a number: #{joinor(brd)}."
    square = gets.chomp
    break if valid_move?(brd, square)
    prompt "Sorry, #{square} is not a valid choice. Try again."
  end
  brd[square.to_i] = PLAYER_MARK
end

def valid_move?(brd, square)
  open_spots(brd).include?(square.to_i) && square.to_i.to_s == square
end

# Computer chooses position, modifies board
def comp_choice!(brd)
  spot = comp_strategy(brd)
  brd[spot] = COMP_MARK
end

# Core of computer's decision making rules
def comp_strategy(brd)
  if immediate_win?(brd)
    winning_spot(brd)
  elsif immediate_loss?(brd)
    defend_spot(brd)
  elsif middle_open?(brd)
    5
  else
    random_move(brd)
  end
end

# Returns any winning combo arrays that only need one spot to win
def almost_win_combo(spots_picked, brd)
  # First find the arrays that are 2/3 filled by comp or player
  possible_winners = WIN_COMBOS.select { |arr| (arr - spots_picked).size == 1 }
  # From those arrays, pick the ones that aren't completely full
  possible_winners.select { |arr| (arr - all_taken_spots(brd)).size != 0 }
end

# Is there a possibility to win in one move? Which spot is the winning move?
def immediate_win?(brd)
  !almost_win_combo(comp_spots(brd), brd).flatten.empty?
end

def winning_spot(brd)
  (almost_win_combo(comp_spots(brd), brd)[0] - comp_spots(brd))[0]
end

# Is there a possibility to lose in one move? Which spot is vulnerable?
def immediate_loss?(brd)
  !almost_win_combo(player_spots(brd), brd).flatten.empty?
end

def defend_spot(brd)
  (almost_win_combo(player_spots(brd), brd)[0] - player_spots(brd))[0]
end

# Is the middle spot available to take?
def middle_open?(brd)
  open_spots(brd).include?(5)
end

# Default if no other conditions apply
def random_move(brd)
  open_spots(brd).sample
end

# Check to see if there is a win condition
def winner?(brd)
  !!who_won?(brd)
end

# Which one won, Juan? Which one?
def who_won?(brd)
  WIN_COMBOS.each do |arr|
    return "Player" if arr.all? { |spot| brd[spot] == PLAYER_MARK }
    return "Computer" if arr.all? { |spot| brd[spot] == COMP_MARK }
  end
  nil
end

# Checks for no available moves condition
def cats_game?(brd)
  open_spots(brd).size == 0
end

# Overall grand champion of match
def champion?(player, comp)
  return "Player" if player >= 5
  return "Computer" if comp >= 5
end

# Instructional prompt at championship beginning
def game_intro
  puts "Instructions: Players will choose a numbered spot on the board to place
  their marker. The next player will then have a chance to place their marker.
  Players continue alternating turns until all spots are taken or one player
  wins by placing their marker 3 in a row (i.e. whole row, column or diagonal).
  First player to win 5 games is the Grand Champion!

  If you are ready to continue, please press 'Enter'."
  gets
end

def play_again?
  prompt "Do you want to play again? (y/n)"
  answer = gets.chomp.downcase
  answer == 'y' || answer == 'yes' ? true : false
end

def game_outro
  system 'clear'
  puts "Thanks for playing TIC-TAC-TOE Championship. Come back soon!"
end

# MAIN LOOP - SET UP NEW CHAMPIONSHIP
loop do
  # Clear scores
  player_score = 0
  comp_score = 0
  # Clear playing board, show welcome text
  board = numbered_board
  display_board(board, player_score, comp_score, WELCOME_MSG)
  game_intro
  # Get preference for who goes first if not already hard-coded
  current = first_player(FIRST_TURN)
  # GAME LOOP
  loop do
    board = initialize_game_board if winner?(board) || cats_game?(board)
    display_board(board, player_score, comp_score, MARKER_MSG)
    # Get input from current player
    current_turn_choice(current, board)
    # Switch current player
    current = current == 'player' ? 'computer' : 'player'
    # Checking for game-ending conditions (win/tie)
    if winner?(board)
      if who_won?(board) == 'Player'
        player_score += 1
        display_board(board, player_score, comp_score, WIN)
      else
        comp_score += 1
        display_board(board, player_score, comp_score, LOSE)
      end
      # Tell player outcome of game, pause until player ready
      prompt "#{who_won?(board)} won! Press 'Enter' to continue."
      gets.chomp
      # Exit game loop and return to main loop when a score reaches 5 points
      break if champion?(player_score, comp_score)
    elsif cats_game?(board)
      # Tell player outcome of game, pause until player ready
      display_board(board, player_score, comp_score, CAT)
      prompt "Cat's game. Nobody wins. Press 'Enter' to continue."
      gets.chomp
    end
  end

  # Displays overall winner of TTT championship
  prompt "#{champion?(player_score, comp_score)} is the TTT Grand Champion!"

  # Ask player if they want another championship?
  break unless play_again?
end
game_outro
