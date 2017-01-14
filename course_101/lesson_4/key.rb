def display_board
  system 'clear'
  puts "You're an X. Computer is an O."
  puts ""
  puts "     |     |" + "      KEY".center(80)
  puts "     |     |   " + " 1 | 2 | 3 ".center(85)
  puts "     |     |" + "---+---+---".center(87)
  puts "-----+-----+-----" + " 4 | 5 | 6 ".center(85)
  puts "     |     |" 
  puts "     |     |   " 
  puts "     |     |" 
  puts "-----+-----+-----"
  puts "     |     |" 
  puts "     |     |   " 
  puts "     |     |" 
end
puts ""
  puts "      KEY".center(80)
  puts " 1 | 2 | 3 ".center(85)
  puts "---+---+---".center(85)
  puts " 4 | 5 | 6 ".center(85)
  puts "---+---+---".center(85)
  puts " 7 | 8 | 9 ".center(85)
# def display_tests
#   puts "     |   |" 
#   puts "   1 | 2 | 3"
#   puts "     |   |"
#   puts " ----+---+----"
#   puts "     |   |"
#   puts "   4 | 5 | 6"
#   puts "     |   |"
#   puts " ----+---+----"
#   puts "     |   |"
#   puts "   7 | 8 | 9"
#   puts "     |   |"
# end

def display_key
  puts "      KEY".center(95)
  puts "-------------".center(100)
  puts "| 1 | 2 | 3 |".center(100)
  puts "----+---+----".center(100)
  puts "| 4 | 5 | 6 |".center(100)
  puts "----+---+----".center(100)
  puts "| 7 | 8 | 9 |".center(100)
  puts "-------------".center(100)
end

display_board
