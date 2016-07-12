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

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
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

def find_at_risk_square(line, brd)
  if brd.values_at(*line).count('X') == 2
    brd.select { |key, value| line.include?(key) && value == ' ' }.keys.first
  else
    nil
  end
end

def find_computer_winning_square(line, brd) # add the marker as an additional argument. 
  if brd.values_at(*line).count('O') == 2
    brd.select { |key, value| line.include?(key) && value == ' ' }.keys.first
  else
    nil
  end
end

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    square = find_at_risk_square(line, brd)
    break if square
  end

  WINNING_LINES.each do |line|
    square = find_computer_winning_square(line, brd)
    break if square
  end

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

score = {player: 0, computer: 0}
board = initialize_board

loop do
  board = initialize_board

  loop do
    display_board(board)
    p score
    p board
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

prompt "#{detect_winner(board)} wins the game!"
prompt "Thank you for playing Tic Tac Toe. Good bye!"
