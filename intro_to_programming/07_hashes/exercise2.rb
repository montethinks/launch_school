# merge vs merge!
cities = {name: "Charlotte"}
weather = {temp: 67}

puts "Starting off with a city hash and a weather hash:"
puts "Cities: #{cities}"
puts "Weather: #{weather}"
puts ''
puts "When we call .merge on cities it will combine the two hashes."
puts cities.merge(weather)
puts "But when we call the hashes again, notice that the hashes have not been modified because the merge method does not mutate the caller."
puts "Cities: #{cities}"
puts "Weather: #{weather}"
puts ''
puts "Below we will merge weather into the cities hash the two hashes using a bang operator (!)."
puts "Cities merged with weather is #{cities.merge!(weather)}"
puts "No what is the output of cities and weather?"
puts "-----------------------"
puts "-----------------------"
puts "-----------------------"
puts "Cities is now a merged hash with Weather and weather is the same."
puts "Cities: #{cities}"
puts "Weather: #{weather}"
