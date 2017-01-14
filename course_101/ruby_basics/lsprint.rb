loop do 
  puts ">> How many output lines do you want? Enter a number greater than or equal to 3:"
  number = gets.chomp.to_i

  if number >= 3
    number.times { puts 'Launch School is the best!' }
    break
  else
    puts ">> That's not enough lines."
  end
end
      


