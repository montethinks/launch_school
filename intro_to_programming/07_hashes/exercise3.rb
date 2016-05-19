# Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

# make a hash
person = {name: "Monte", age: 32, sport: "Basketball"}

puts person.each_key {|key| puts key}
puts person.each_value {|value| puts value}
person.each {|key, value| puts "This is a #{key} and this is a #{value}"}