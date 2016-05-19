# Rewrite your program from exercise 3 using a case statement. Wrap each statement in a method and make sure they both still work.

# puts "Please enter a number between 0 - 100"
# number = gets.chomp.to_i

def evaluate_number(num)
  answer = case
    when num < 0
      puts "#{num} is a negative num."
    when num <= 50
      puts "Your number, #{num}, is 50 or less."
    when ( num == 51 ) || ( num <= 100 )
      puts "Your number, #{num}, is between 51 and 100"
    else
      puts "#{num} is greater than 100." 
    end
  puts answer
end

puts "Please enter a number between 0 - 100"
number = gets.chomp.to_i

evaluate_number(number)

