def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

puts ">> Please enter the numerator:"
numerator = gets.chomp

puts ">> Please enter the denominator:"
denominator = gets.chomp

puts ">> #{numerator} / #{denominator}"