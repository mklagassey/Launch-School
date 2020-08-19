# Deck components
SUITS = ['♠', '♦', '♥', '♣']
# rubocop:disable Layout/FirstArrayElementIndentation
CARDS = [
          [" 2", [2]], [" 3", [3]], [" 4", [4]], [" 5", [5]], [" 6", [6]],
          [" 7", [7]], [" 8", [8]], [" 9", [9]], ["10", [10]], [' J', [10]],
          [' Q', [10]], [' K', [10]], [' A', [11]]
        ]

BLANK_CARD = [
               '┌─────────┐',
               '│ 🚀 🚀 🚀│',
               '│▼▼▼▼▼▼▼▼▼│',
               '│ LAUNCH↜↜│',
               '│↝↝SCHOOL │',
               '│▲▲▲▲▲▲▲▲▲│',
               '│ ⮂  ⮂  ⮂ │',
               '└─────────┘'
             ]

CARD_ICONS = [
               '🂡', '🂢', '🂣', '🂤', '🂥', '🂦', '🂧', '🂨', '🂩', '🂪', '🂫', '🂭',
               '🂮', '🂱', '🂲', '🂳', '🂴', '🂵', '🂶', '🂷', '🂸', '🂹', '🂺', '🂻',
               '🂽', '🂾', '🃁', '🃂', '🃃', '🃄', '🃅', '🃆', '🃇', '🃈', '🃉', '🃊',
               '🃋', '🃍', '🃎', '🃑', '🃒', '🃓', '🃔', '🃕', '🃖', '🃗', '🃘', '🃙',
               '🃚', '🃛', '🃝', '🃞'
             ]
# rubocop:enable Layout/FirstArrayElementIndentation

# Game goal and variable calculations
BUST = 21
DECK_SIZE = SUITS.size * CARDS.size
DEALER_HIT_MINIMUM = (BUST / 1.2).to_i
PAYOUT_MULTIPLIER = 2

# For the text prettifier
COLORS = { "default" => "38", "black" => "30", "red" => "31", "green" => "32",
           "brown" => "33", "blue" => "34", "purple" => "35", "cyan" => "36",
           "gray" => "37", "dark gray" => "1;30", "light red" => "1;31",
           "light green" => "1;32", "yellow" => "1;33", "light blue" => "1;34",
           "light purple" => "1;35", "light cyan" => "1;36", "white" => "1;37" }

# Starting cash and minimum amount to buy in
STARTING_CHIPS = 100
MIN_BET = 5

# Methods to make text more attention grabbing
def colorize(text, color = "default")
  color_code = COLORS[color]
  "\033[#{color_code}m#{text}\033[0m"
end

def flash(msg, color = 'default', frequency = 2)
  counter = 0
  loop do
    print "\r#{colorize(msg, color)}" if counter.even?
    print "\r#{msg}" if counter.odd?
    break if counter == 10
    sleep((frequency.to_f / msg.size.to_f))
    counter += 1
  end
  puts ''
end

def slow_text(msg, delay = 0.1)
  counter = 0
  loop do
    break if counter == msg.size
    print "\r#{msg[0..counter]}"
    sleep delay
    counter += 1
  end
  puts ''
end

# rubocop:disable Metrics/MethodLength
def game_intro
  system 'clear'
  puts colorize('BETA 0.1', 'red')
  puts %(
    #{colorize("--------------------- Welcome to VEGAS-STAKES #{BUST}™! " \
    '---------------------', 'yellow')}
  )
  puts %(
  The goal is to get as close to #{BUST} as you can*. Number cards are worth
  their number value, face cards (jack/queen/king) are worth 10 and aces are
  worth either 1 or 11. After your first two cards are dealt, you can choose
  either hit (h) for another card or stay (s) if you are done with your turn.
  The dealer then takes their turn and will automatically hit until they
  reach at least #{DEALER_HIT_MINIMUM}. ) \
  'Winner is the one who has the highest score.'
  puts %(
  *#{colorize("Don't go over #{BUST} though or you'll bust!", 'red')}
  )

  flash "                     Press 'enter' when ready to continue.", 'black', 5
  gets
  system 'clear'
end
# rubocop:enable Metrics/MethodLength

# All methods to initialize the deck one card at a time
def shuffle_deck
  deck = []
  loop do
    break if deck.size >= DECK_SIZE
    deck << deal_card(deck)
  end
  deck
end

def deal_card(arr)
  card = nil
  loop do
    new_suit = rand_suit
    new_card = rand_card
    card_data = [new_suit, new_card].flatten
    next if already_added?(arr, card_data)
    card = card_data
    break
  end
  card
end

def rand_suit
  SUITS.sample
end

def rand_card
  CARDS.sample
end

# Checks the first two elements, suit and value, to see if card is in the deck
def already_added?(deck, card)
  deck.select { |el| el.first(2) == card.first(2) }.empty? ? false : true
end

def game_begin_msg(first_game)
  if first_game
    say_something "Please wait while dealer shuffles the deck..."
    shuffle_animation
  else
    system 'clear'
    say_something "Welcome back, player."
  end
end

def shuffle_animation
  counter = 52
  arrow = '✋'
  loop do
    break if counter == 0
    print %(🤚 \r#{CARD_ICONS.sample} #{arrow} #{CARD_ICONS.sample})
    sleep 0.1
    arrow += '✋'
    arrow = '✋' if arrow.size > 5
    counter -= 1
  end
  system 'clear'
  puts '🙌'
end

# Gives a voice to the game, at least on Macs, shouldn't throw errors anymore on
# other platforms
def say_something(msg)
  puts msg
  system "say", msg
end

# All methods related to betting
def take_bet(cash)
  puts "Your available balance is: $#{colorize cash, 'green'}"
  say_something "Place your bets, please. Table minimum is #{MIN_BET} dollars."
  puts "Choose (min), (max) or input dollar amount you wish to wager."
  gets.chomp.downcase
end

def check_bet(bet, cash)
  loop do
    if min_or_max?(bet)
      return bet == 'min' ? MIN_BET : cash
    elsif valid_bet?(bet, cash)
      return bet.to_i
    else
      bet = bet_error_msg(bet, cash)
    end
  end
end

def min_or_max?(bt)
  bt == 'min' || bt == 'max'
end

def valid_bet?(bt, csh)
  dollar_amount?(bt) && bet_enough?(bt) && enough_cash?(bt, csh)
end

def dollar_amount?(b)
  b.to_i.to_s == b
end

def bet_enough?(b)
  b.to_i >= MIN_BET
end

def enough_cash?(b, c)
  b.to_i <= c
end

def bet_error_msg(bt, csh)
  puts "\a"
  if !enough_cash?(bt, csh)
    say_something "Sorry player, your bankroll can't handle a #{bt} dollar" \
                  " bet. Please choose a smaller amount."
  else
    say_something "Sorry, please pick 'min', 'max' or enter a number up to" \
    " #{csh} dollars to bet."
  end
  gets.chomp.downcase
end

def bet_message(bet, cash)
  if bet.to_i == cash
    say_something "Woah, big fish! We've got a high roller here betting it all!"
  else
    say_something "Player bets #{bet} dollars, good luck player!"
  end
end

# Determines whether player gets a payout, return of initial bet or nothing
def settle_up_bet(p_hand, c_hand, bet)
  p_total = total(p_hand)
  c_total = total(c_hand)
  if win_bet?(p_total, c_total)
    bet * PAYOUT_MULTIPLIER
  elsif p_total == c_total
    bet
  else
    0
  end
end

# Is there a win condition?
def win_bet?(p_tot, c_tot)
  c_tot > BUST || ((p_tot > c_tot) && p_tot <= BUST)
end

def initial_cards_msg
  say_something "...dealing out first two cards."
  sleep 1
end

# Deals first two cards from deck to each player's hand array
def first_two!(player, computer, deck)
  2.times { |_| computer << deck.pop }
  2.times { |_| player << deck.pop }
end

# Updates the cards displayed and indicates whose turn it is by flashing name
def show_both_hands(player, computer, turn, blank = false)
  system 'clear'
  if turn == 'c'
    flash(" ~~ DEALER'S CARDS ~~ ", 'purple')
    puts ''
  else
    puts " ~~ DEALER'S CARDS ~~ "
  end
  show_hand(computer, blank)
  if turn == 'p'
    flash(" >>>> YOUR CARDS <<<<", 'cyan')
    puts ''
  else
    puts " >>>> YOUR CARDS <<<<"
  end
  show_hand(player)
end

# Makes the game more realistic by showing cards visually, basically where the
# hand array is automagically converted into the pretty output array
def show_hand(hand_arr, blank = false)
  vertical_hand = hand_arr.map { |elem| new_card(elem[1], elem[0]) }
  vertical_hand[0].replace BLANK_CARD if blank == true
  vertical_hand = red_card!(vertical_hand)
  horizontal_hand = Array.new(8) { |_| '' }
  vertical_hand.each do |card|
    card.each.with_index { |line, i| horizontal_hand[i] << line }
  end
  puts horizontal_hand
end

# The template array used to output pretty cards, input comes from hand array
def new_card(rank, suit)
  lines = Array.new(8) { |_| '' }

  lines[0] << '┌─────────┐'
  lines[1] << "│#{rank}       │"
  lines[2] << '│         │'
  lines[3] << "│    #{suit}    │"
  lines[4] << '│         │'
  lines[5] << '│         │'
  lines[6] << "│      #{rank} │"
  lines[7] << '└─────────┘'
  lines
end

# Makes the diamonds and hearts the correct color
def red_card!(hand)
  new_hand = hand.map do |card|
    if card.join.include?('♥') || card.join.include?('♦')
      card.map { |line| line.gsub(/[\w♦♥]/) { |c| colorize c, 'red' } }
    else
      card
    end
  end
  new_hand
end

def player_turn(p_hand, c_hand, dck)
  hand_check!(p_hand)
  total = total(p_hand)
  loop do
    # Ask if player wants another card, go to dealer's turn if 'no' or busted
    break if total >= BUST || hit_or_stay?
    say_something "Player hits."
    # Deal another card to player if they chose 'hit'
    p_hand << dck.pop
    # If hand is over BUST and hand has an ace worth 11, change ace to 1
    hand_check!(p_hand)
    # Update player hand score
    total = total(p_hand)
    show_both_hands(p_hand, c_hand, 'p', true)
  end
end

def hit_or_stay?
  ans = ''
  loop do
    puts "Do you want to hit (h) or stay (s)?"
    ans = gets.chomp.downcase
    break if ans == 's' || ans == 'h' || ans == 'stay' || ans == 'hit'
    puts "\a"
    slow_text "Sorry, #{ans} is not valid. Please type either 'hit' or 'stay'."
  end
  ans[0] == 's'
end

# If potential bust condition exists, try to save it by changing high ace to low
def hand_check!(arr)
  while over_bust?(arr) && first_hi_ace?(arr)
    convert_ace!(arr)
  end
end

# Is the value of hand a potential bust?
def over_bust?(arr)
  total(arr) > BUST
end

# Value of all cards in hand
def total(arr)
  arr.reduce(0) { |total, card| total + card[2] }
end

# Are there any aces worth 11 in the hand? Where is the first one?
def first_hi_ace?(arr)
  arr.index { |card| card.last == 11 }
end

# Change the value of high ace to 1
def convert_ace!(arr)
  arr[first_hi_ace?(arr)][2] = 1
end

def computer_turn(p_hand, c_hand, dck)
  p_total = total(p_hand)
  say_something "Player stays." if p_total <= BUST
  loop do
    hand_check!(c_hand)
    c_total = total(c_hand)
    # Skip to endgame if hand is worth at least dealer min or player busted
    break if c_total > DEALER_HIT_MINIMUM || p_total > BUST
    # Hit
    c_hand << dck.pop
    say_something "Dealer hits."
    show_both_hands(p_hand, c_hand, 'c', true)
  end
end

def win_lose_draw(p_hand, c_hand)
  p_total = total(p_hand)
  c_total = total(c_hand)
  if either_player_busted?(p_total, c_total)
    display_busted(p_hand, c_hand, p_total, c_total)
  elsif draw?(p_total, c_total)
    display_draw(p_hand, c_hand, p_total)
  else
    display_win_lose(p_hand, c_hand, p_total, c_total)
  end
end

def either_player_busted?(p_tot, c_tot)
  p_tot > BUST || c_tot > BUST
end

def display_busted(p_hnd, c_hnd, p_tot, c_tot)
  player_bust_msg(p_hnd, c_hnd, p_tot) if p_tot > BUST
  computer_bust_msg(p_hnd, c_hnd, c_tot) if c_tot > BUST
end

def player_bust_msg(p_hnd, c_hnd, p_tot)
  show_both_hands(p_hnd, c_hnd, '', true)
  say_something "Player busts with #{p_tot}, dealer wins!"
end

def computer_bust_msg(p_hnd, c_hnd, c_tot)
  show_both_hands(p_hnd, c_hnd, '')
  say_something("Dealer busts with #{c_tot}, you win!")
  puts ''
end

def draw?(p_tot, c_tot)
  p_tot == c_tot
end

def display_draw(p_hnd, c_hnd, p_tot)
  show_both_hands(p_hnd, c_hnd, '')
  say_something "It's a push game. You and dealer tied at #{p_tot}."
end

def display_win_lose(p_hnd, c_hnd, p_tot, c_tot)
  hand_win_msg(p_hnd, c_hnd, p_tot, c_tot) if p_tot > c_tot
  hand_lose_msg(p_hnd, c_hnd, p_tot, c_tot) if p_tot < c_tot
end

def hand_win_msg(p_hnd, c_hnd, p_tot, c_tot)
  show_both_hands(p_hnd, c_hnd, 'p')
  flash("+++++++++++++++ CONGRATULATIONS! ++++++++++++++++", 'yellow', 5)
  puts ''
  flash('$$$$ You WIN! $$$$', 'green')
  say_something "Your #{p_tot} beats the dealer's #{c_tot}."
end

def hand_lose_msg(p_hnd, c_hnd, p_tot, c_tot)
  show_both_hands(p_hnd, c_hnd, 'c')
  puts "Dealer's #{c_tot} beats your #{p_tot}."
  say_something "Better luck next time player."
end

# Did the player lose all their money?
def broke?(cash)
  cash <= 0
end

def play_again?
  ans = nil
  loop do
    slow_text ">>> Play again? (y/n)"
    ans = gets.chomp.downcase
    break if ans == 'y' || ans == 'n' || ans == 'yes' || ans == 'no'
    puts "\a"
    slow_text "Sorry, please type either 'y' or 'n'."
  end
  ans[0] == 'y'
end

# Three game outcome messages: regular player, beat the house or broke as a joke
def game_outro(cash)
  system 'clear'
  if player_lost_money?(cash)
    normal_end_msg
  elsif broke?(cash)
    broke_msg
  else
    big_win_msg(cash)
  end
end

def player_lost_money?(csh)
  csh > 0 && csh <= STARTING_CHIPS
end

def normal_end_msg
  puts "Thanks for playing #{colorize("VEGAS STAKES #{BUST}", 'yellow')}."
  say_something "We hope you enjoyed the game!"
end

def broke_msg
  say_something "Don't hate the coder, hate the game."
  slow_text %(BUMMER...
  You are completely broke! Come back when you've got some cash.
                                      ...we can always use more money!)
  sleep 1
end

# rubocop:disable Metrics/MethodLength
def big_win_msg(csh)
  say_something "Well done player!"
  flash "+++++++++ YOU'RE A WINNER! ++++++++++++", 'blue'
  puts "You beat the odds and walked away with $" \
       "#{colorize((csh - STARTING_CHIPS), 'green')} of the house's money."
  puts "#{colorize('
                  ,:/+/-
              /M/              .,-=;//;-
         .:/= ;MH/,    ,=/+%$XH@MM#@:
        -$##@+$###@H@MMM#######H:.    -/H#
   .,H@H@ X######@ -H#####@+-     -+H###@X
    .,@##H;      +XM##M/,     =%@###@X;-
  X%-  :M##########$.    .:%M###@%:
  M##H,   +H@@@$/-.  ,;$M###@%,          -
  M####M=,,---,.-%%H####M$:          ,+@##
  @##################@/.         :%H##@$-
  M###############H,         ;HM##M$=
  #################.    .=$M##M$=
  ################H..;XM##M$=          .:+
  M###################@%=           =+@MH%
  @#################M/.         =+H#X%=
  =+M###############M,      ,/X#H+:,
    .;XM###########H=   ,/X#H+:;
       .=+HM#######M+/+HM@+=.
           ,:/%XM####H/.
                ,.:=-.', 'brown')}
    And this cake. Enjoy it. You monster.
            "
end
# rubocop:enable Metrics/MethodLength

# Set up new game
game_intro
first_game = true
player_cash = STARTING_CHIPS
# Main game loop
loop do
  player_hand = []
  computer_hand = []
  deck = shuffle_deck
  game_begin_msg(first_game)
  player_bet = check_bet(take_bet(player_cash), player_cash)
  bet_message(player_bet, player_cash)
  player_cash -= player_bet
  initial_cards_msg
  # Deal both players their first two cards
  first_two!(player_hand, computer_hand, deck)
  # Display player's hand and dealer's "up" card, one at a time
  show_both_hands(player_hand, computer_hand, 'c', true)
  show_both_hands(player_hand, computer_hand, 'p', true)
  # Player turn loop
  player_turn(player_hand, computer_hand, deck)
  # Computer turn loop
  computer_turn(player_hand, computer_hand, deck)
  # Shows outcome of game
  win_lose_draw(player_hand, computer_hand)
  # Handles bet outcome calculations
  player_cash += settle_up_bet(player_hand, computer_hand, player_bet)
  break if broke?(player_cash)
  first_game = false
  play_again? ? next : break
end
game_outro(player_cash)
