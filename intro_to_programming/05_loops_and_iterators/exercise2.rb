# Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

puts "What's the secret password?"
input = gets.chomp
puts ''

while input != "STOP" 
  if input == "STOP"
    break
  else
    puts "Nah ah ah, you didn't say the magic word."  
    input = gets.chomp
  end
end


