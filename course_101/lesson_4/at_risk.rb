require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]].freeze # diagonals

INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze

def joinor(arr, delimiter=', ', separator='or')
  arr[-1] = "#{separator} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "The first player to win 5 games wins!"
  puts ""
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
    prompt "Choose a square (#{joinor(empty_squares(brd))}):" # (#{empty_squares(brd).join(', ')}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count('X') == 2
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first
    binding.pry
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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def winner(games)
  games.keys.select { |player| games[player] == 5 }
end

def find_at_risk_square(line, board)
  if board.values_at(*line).count('X') == 2
    board.select{|k,v| line.include?(k) && v == ' '}.keys.first
  else
    nil
  end
end

score = { player: 0, computer: 0 }

loop do
  board = initialize_board

  loop do
    display_board(board)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    find_at_risk_square(line, board)
    binding.pry

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  puts ""

  if detect_winner(board) == 'Player'
    score[:player] += 1
  elsif detect_winner(board) == 'Computer'
    score[:computer] += 1
  end

  prompt "Score:  Player - #{score[:player]}    Computer - #{score[:computer]}"

  break unless winner(score).empty?
  prompt "Game over. #{detect_winner(board)} won!"
  # if winner(score).empty?
  # else
  #   prompt "Game over. #{detect_winner(board)} won!"
  #   break
  # end

  prompt "Keep playing? (y or n)"
  answer = gets.chomp.downcase
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe. Good bye!"
