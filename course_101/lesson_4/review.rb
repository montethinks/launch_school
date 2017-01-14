INITIAL_MARKER = ' '.freeze
PLAYER_MARKER = 'X'.freeze
COMPUTER_MARKER = 'O'.freeze
FIRST_PLAYER = 'choose'.freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]
MAX_ROUNDS = 5

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system('clear') || system('cls')
end

def print_help
  puts "#{'-' * 5}  The first to 5 wins  #{'-' * 5}"

  puts "\n\n#{' ' * 6}Enter the number for" \
       "\n#{' ' * 6}the square you want:"
  generate_board

  puts "\n#{' ' * 3}help     Show this guide"
  puts "#{' ' * 3}board    Show current board"
  puts "\n#{'-' * 33}"
end

def print_score(scores)
  puts "#{PLAYER_MARKER}  #{'-' * 9}  " \
       "#{scores[0]} : #{scores[1]}" \
       "  #{'-' * 9}  #{COMPUTER_MARKER}"
end

def print_board(brd, scores)
  clear_screen
  print_score(scores)
  puts "\n"
  generate_board(brd)
  puts "\n#{'-' * 33}"
end

def print_response(input, brd, scores)
  if input == 'help'
    print_help
  elsif input == 'board'
    print_board(brd, scores)
  end
end

def initialize_board
  Hash[(1..9).map { |num| [num, INITIAL_MARKER] }]
end

def generate_board(brd=(0..9).to_a)
  rjust = " " * 6
  puts <<-BOARD
  #{rjust}     |     |
  #{rjust}  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}
  #{rjust}     |     |
  #{rjust}-----------------
  #{rjust}     |     |
  #{rjust}  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}
  #{rjust}     |     |
  #{rjust}-----------------
  #{rjust}     |     |
  #{rjust}  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}
  #{rjust}     |     |
  BOARD
end

def choose_player(brd, scores)
  loop do
    prompt "Do you want to go first? (y/n)"
    input = gets.chomp.downcase

    break 'player' if %w(y yes).include?(input)
    break 'computer' if %w(n no).include?(input)

    print_response(input, brd, scores)
    prompt "Invalid input. Type 'help' for help." unless %w(help board).include?(input)
  end
end

def joinor(arr, delimiter=', ', word='or')
  arr[-1] = "#{word} #{arr.last}" if arr.size > 1
  return arr.join(' ') if arr.size == 2
  arr.join(delimiter)
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def markers_at(brd, line)
  brd.values_at(*line)
end

def line_marker_count(brd, line, marker)
  markers_at(brd, line).count(marker)
end

def find_square(brd, line, marker)
  if (line_marker_count(brd, line, marker) > 1) && (line_marker_count(brd, line, INITIAL_MARKER) == 1)
    return line[markers_at(brd, line).index(INITIAL_MARKER)]
  end
end

def computer_strategy(brd, marker)
  WINNING_LINES.each do |line|
    square = find_square(brd, line, marker)
    return square if square
  end
  nil
end

def computer_places_piece!(brd)
  square = computer_strategy(brd, COMPUTER_MARKER)
  square ||= computer_strategy(brd, PLAYER_MARKER)
  square ||= 5 if empty_squares(brd).include?(5)
  square ||= empty_squares(brd).sample

  prompt "Computer is choosing..."
  sleep(0.75)
  brd[square] = COMPUTER_MARKER
end

def player_places_piece!(brd, scores)
  loop do
    prompt "Choose square #{joinor(empty_squares(brd))}:"
    input = gets.chomp.downcase

    break brd[input.to_i] = PLAYER_MARKER if empty_squares(brd).include?(input.to_i)

    print_response(input, brd, scores)
    prompt "Invalid input. Type 'help' for help." unless %w(help board).include?(input)
  end
end

def place_piece!(brd, curr_player, scores)
  if curr_player == 'player'
    player_places_piece!(brd, scores)
  elsif curr_player == 'computer'
    computer_places_piece!(brd)
  end
end

def alternate_player(curr_player)
  curr_player == 'player' ? 'computer' : 'player'
end

def alternate_turns!(brd, curr_player, scores)
  loop do
    print_board(brd, scores)
    place_piece!(brd, curr_player, scores)
    curr_player = alternate_player(curr_player)
    break if someone_won?(brd) || board_full?(brd)
  end
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return 'player' if line_marker_count(brd, line, PLAYER_MARKER) == 3
    return 'computer' if line_marker_count(brd, line, COMPUTER_MARKER) == 3
  end
  nil
end

def winner?(brd, player)
  detect_winner(brd) == player
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def countdown_next_round(brd, scores)
  5.downto(0) do |num|
    print_board(brd, scores)
    print_round_winner(brd)

    prompt "Starting next round in #{num}..."
    if num == 0
      clear_screen
    else
      sleep(1)
    end
  end

  print_board(brd, scores)
end

def print_round_winner(brd)
  if someone_won?(brd)
    if winner?(brd, 'player')
      prompt "You won!"
    elsif winner?(brd, 'computer')
      prompt "The computer won!"
    end
  else
    prompt "It's a tie!"
  end
end

def print_game_winner(player, computer)
  if player == MAX_ROUNDS
    prompt "Congrats, you reached 5 first!"
  elsif computer == MAX_ROUNDS
    prompt "The computer reached 5 first. You lost :("
  end
end

def next_round?(brd, player, computer)
  if (MAX_ROUNDS > player) && (MAX_ROUNDS > computer)
    countdown_next_round(brd, [player, computer])
    return true
  elsif (MAX_ROUNDS <= player) || (MAX_ROUNDS <= computer)
    print_board(brd, [player, computer])
    print_game_winner(player, computer)
  end
  false
end

def play_again?(brd, scores)
  loop do
    prompt("Do you want to play again? (y/n)")
    input = gets.chomp.downcase

    break true if %w(y yes).include?(input)
    break false if %w(n no).include?(input)

    print_response(input, brd, scores)
    prompt "Invalid input. Type 'help' for help." unless %w(help board).include?(input)
  end
end

clear_screen

puts <<-INTRO
=================================
     Welcome to Tic Tac Toe!
=================================
INTRO

print_help

current_player = 'player'
player_score = computer_score = 0

loop do
  board = initialize_board
  if FIRST_PLAYER == 'choose'
    current_player = choose_player(board, [player_score, computer_score])
  elsif (FIRST_PLAYER == 'player') || (FIRST_PLAYER == 'computer')
    current_player = FIRST_PLAYER
  end

  alternate_turns!(board, current_player, [player_score, computer_score])

  if someone_won?(board)
    if winner?(board, 'player')
      player_score += 1
    elsif winner?(board, 'computer')
      computer_score += 1
    end
  end

  next if next_round?(board, player_score, computer_score)

  if play_again?(board, [player_score, computer_score])
    player_score = computer_score = 0
  else
    break
  end
end

prompt "Thanks for playing. Goodbye!"