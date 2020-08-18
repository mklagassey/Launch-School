# require 'pry'
#
# suits_symbols = ['♠', '♦', '♥', '♣']
# cards = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']
# player_cards = []
#
#
# def random_rank(cards)
#   cards.sample
# end
#
# def random_suit(symbols)
#   symbols.sample
# end
#
# def new_card(rank, suit)
#   lines = Array.new(8) { |_| '' }
#
#   lines[0] << '┌─────────┐'
#   lines[1] << "│ #{rank}       │"
#   lines[2] << '│         │'
#   lines[3] << "│    #{suit}    │"
#   lines[4] << '│         │'
#   lines[5] << '│         │'
#   lines[6] << "│       #{rank} │"
#   lines[7] << '└─────────┘'
#   lines
# end
#
# # noob = [
# #   '┌─────────┐',
# #   "│ #{rank}       │",
# #   '│         │',
# #   "│    #{suit}    │",
# #   '│         │',
# #   '│         │',
# #   "│       #{rank} │",
# #   '└─────────┘'
# # ]
#
#
# hidden = [['┌─────────┐'],
#           ['│░░░░░░░░░│'],
#           ['│░░░░░░░░░│'],
#           ['│░░░░░░░░░│'],
#           ['│░░░░░░░░░│'],
#           ['│░░░░░░░░░│'],
#           ['│░░░░░░░░░│'],
#           ['└─────────┘']
#         ]
#
# blank = [
#   '┌─────────┐',
#   '│░░░░░░░░░│',
#   '│░░░░░░░░░│',
#   '│░░░░░░░░░│',
#   '│░░░░░░░░░│',
#   '│░░░░░░░░░│',
#   '│░░░░░░░░░│',
#   '└─────────┘'
# ]
# # binding.pry
# # Creates first deck
# def add_cards(first, second)
#   first.map.with_index do |elem, i|
#     # binding.pry
#     elem[0] + second[i][0]
#   end
# end
# # Does what it says, takes deck and adds new card
# def add_card_to_deck(deck, card)
#   deck.map.with_index do |elem, i|
#     # binding.pry
#     elem + card[i][0]
#   end
# end
#
# def make_visual_hand(hand_arr)
#   vertical_hand = []
#   vertical_hand = hand_arr.map do |elem|
#     new_card(elem[1], elem[0])
#   end
#   horizontal_hand = Array.new(8) { |_| '' }
#   vertical_hand.each do |card|
#     card.each.with_index { |line, i| horizontal_hand[i] << line }
#   end
#   horizontal_hand
# end
#
# player_hand = [
#   ['♠', 'A', 11],
#   ['♦', 'K', 10],
#   ['♥', 'Q', 10],
#   ['♣', 'J', 10]
# ]
#
# puts make_player_hand(player_hand)
#
# def red(mytext) ; "\e[31m#{mytext}\e[0m" ; end
# puts red("hello world")

# class Colorizator
#     COLOURS = { default: '38', black: '30', red: '31', green: '32', brown: '33', blue: '34', purple: '35',
#                 cyan: '36', gray: '37', dark_gray: '1;30', light_red: '1;31', light_green: '1;32', yellow: '1;33',
#                 light_blue: '1;34', light_purple: '1;35', light_cyan: '1;36', white: '1;37' }.freeze
#     BG_COLOURS = { default: '0', black: '40', red: '41', green: '42', brown: '43', blue: '44',
#                    purple: '45', cyan: '46', gray: '47', dark_gray: '100', light_red: '101', light_green: '102',
#                    yellow: '103', light_blue: '104', light_purple: '105', light_cyan: '106', white: '107' }.freeze
#
#     FONT_OPTIONS = { bold: '1', dim: '2', italic: '3', underline: '4', reverse: '7', hidden: '8' }.freeze
#
#     def self.colorize(text, colour = :default, bg_colour = :default, **options)
#         colour_code = COLOURS[colour]
#         bg_colour_code = BG_COLOURS[bg_colour]
#         font_options = options.select { |k, v| v && FONT_OPTIONS.key?(k) }.keys
#         font_options = font_options.map { |e| FONT_OPTIONS[e] }.join(';').squeeze
#         return "\e[#{bg_colour_code};#{font_options};#{colour_code}m#{text}\e[0m".squeeze(';')
#     end
# end
#
# puts Colorizator.colorize "Hello World", :gray, :white
# puts Colorizator.colorize "Hello World", :light_blue, bold: true
# puts Colorizator.colorize "Hello World", :light_blue, :white, bold: true, underline: true
# self.colorize 'hello'

# def colorize(text, color = "default", bgColor = "default")
#   colors = {"default" => "38","black" => "30","red" => "31","green" => "32","brown" => "33", "blue" => "34", "purple" => "35",
#    "cyan" => "36", "gray" => "37", "dark gray" => "1;30", "light red" => "1;31", "light green" => "1;32", "yellow" => "1;33",
#     "light blue" => "1;34", "light purple" => "1;35", "light cyan" => "1;36", "white" => "1;37"}
#   bgColors = {"default" => "0", "black" => "40", "red" => "41", "green" => "42", "brown" => "43", "blue" => "44",
#    "purple" => "45", "cyan" => "46", "gray" => "47", "dark gray" => "100", "light red" => "101", "light green" => "102",
#    "yellow" => "103", "light blue" => "104", "light purple" => "105", "light cyan" => "106", "white" => "107"}
#   color_code = colors[color]
#   bgColor_code = bgColors[bgColor]
#   return "\033[#{bgColor_code};#{color_code}m#{text}\033[0m"
# end
#
# puts colorize 'hello', 'red'

CARD_ICONS = [
  '🂡', '🂢', '🂣', '🂤', '🂥', '🂦', '🂧', '🂨', '🂩', '🂪', '🂫', '🂭', '🂮', '🂱', '🂲', '🂳', '🂴', '🂵', '🂶', '🂷', '🂸', '🂹', '🂺', '🂻', '🂽', '🂾',
  '🃁', '🃂', '🃃', '🃄', '🃅', '🃆', '🃇', '🃈', '🃉', '🃊', '🃋', '🃍', '🃎',
  '🃑', '🃒', '🃓', '🃔', '🃕', '🃖', '🃗', '🃘', '🃙', '🃚', '🃛', '🃝', '🃞'
]

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
#
# slow_text("My name is Bob.")

def say_something(msg)
  puts "#{msg}"
  `say "#{msg}."`
end



def shuffle_animation
  counter = 52
  loop do
    break if counter == 0
    print "\r#{CARD_ICONS.sample} >>>> #{CARD_ICONS.sample}"
    sleep 0.1
    counter -= 1
  end
end

def two_bits(mult)
  system 'clear'
  puts "\a" # Shave
  sleep (0.241 * mult)
  system 'clear'
  puts "\a" # and
  sleep (0.078 * mult)
  system 'clear'
  puts "\a" # a
  sleep (0.071 * mult)
  system 'clear'
  puts "\a" # hair
  sleep (0.235 * mult)
  system 'clear'
  puts "\a" # cut
  sleep (0.438 * mult)
  system 'clear'
  puts "\a" # two
  sleep (0.223 * mult)
  system 'clear'
  puts "\a" # bits
  sleep 1
end

# shuffle_animation
say_something("Come back when you're feeling lucky, Rox")
# two_bits 2


# go(0)

































# #
