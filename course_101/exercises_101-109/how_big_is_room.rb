puts "Enter the length of the room in meters:"
length = gets.chomp.to_f

puts "Enter the width of the room in meters:"
width = gets.chomp.to_f

area = length * width
sq_feet = area * 10.7639 

puts "The area of the room is #{area} square meters (#{sq_feet.round(2)} square feet)."
