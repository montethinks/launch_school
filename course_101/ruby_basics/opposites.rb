def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

puts "Please enter a positive or negative integer."
first_num = gets.to_i

puts "Please enter a positive or negative integer."
second_num = gets.to_i

puts "#{first_num}, #{second_num}"