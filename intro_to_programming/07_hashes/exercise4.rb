person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "This person's name using fetch is: #{person.fetch(:name)}."
puts "This person's name using hash_name[key] is: #{person[:name]}."