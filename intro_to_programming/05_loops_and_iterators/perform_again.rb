loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end

# puts "Do you want to do that again? (Y/n)"
# answer = gets.chomp

# while answer == 'Y'
#   puts "Do you want to do that again? (Y/n)"
#   answer = gets.chomp
# end