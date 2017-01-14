require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def prompt(msg)
  puts "=> #{msg}"
end

def welcome_message
  puts "*************************"
  puts "Welcome to Tic Tac Toe!"
  puts "*************************"
  puts ''
  puts ''
  puts "Who should go first? (p)layer, (c)omputer, or (r)andom"
end

def choose_player(current_player)

end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear' || system 'cls'
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def display_score(player1, player2)
  puts "Score:  Player -- #{score[player1]}  Computer -- #{score[player2]}"
end

def display_key
  puts "     |   |" 
  puts "   1 | 2 | 3"
  puts "     |   |"
  puts " ----+---+----"
  puts "     |   |"
  puts "   4 | 5 | 6"
  puts "     |   |"
  puts " ----+---+----"
  puts "     |   |"
  puts "   7 | 8 | 9"
  puts "     |   |"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |key, value| line.include?(key) && value == INITIAL_MARKER }.keys.first
  else
    nil
  end
end


def computer_places_piece!(brd)
  # offense
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd, COMPUTER_MARKER)
    break if square
  end

  # defense
  if !square
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, brd, PLAYER_MARKER)
      break if square
    end
  end

  # pick square #5 
  if !square
    square = 5 if empty_squares(brd).include?(5)
  end

  # picking a random square 
  if !square
    square = empty_squares(brd).sample
  end
    
    brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def joinor(array, delimiter=', ', word='or')
  array[-1] = "#{word} #{array.last}" if array.size > 1
  if array.size == 2
    array.join(' ')
  else
    array.join(delimiter)
  end
end

# ---------------- #
#     GAME         #
# ---------------- #

score = {player: 0, computer: 0, tie: 0}
PLAYER_CHOICE = nil

loop do 
  welcome_message
  player = gets.chomp.downcase
  PLAYER_CHOICE = player
  break if player != player.empty?
end

binding.pry

loop do
  board = initialize_board

  loop do
    display_board(board)
    # p score
    # p board
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end


  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} has won this round!"
  else
    prompt "It's a tie!"
  end

  if detect_winner(board) == 'Player'
    score[:player] += 1
  elsif detect_winner(board) == 'Computer'
    score[:computer] += 1
  else
    score[:tie] += 1
  end

  break if score[:player] == 5 || score[:computer] == 5

  # check the score
  # if the player score == 5
  #   prompt "Player has won all 5 games!"
  # elsif computer_score == 5
  #   prompt "Computer has won all 5 games!"
  # end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thank you for playing Tic Tac Toe. Good bye!"
