# Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Please enter a number between 0 - 100"
number = gets.chomp.to_i

if number < 0
  puts "#{number} is a negative number."
elsif number <= 50
  puts "Your number, #{number}, is 50 or less."
elsif ( number == 51 ) || ( number <= 100 )
  puts "Your number, #{number}, is between 51 and 100"
else
  puts "#{number} is greater than 100."

end

# test boundary conditions first. (number < 0) && (number > 100) 