require 'pry'

# Create a hash that expresses the frequency with which each letter occurs in this string:

# Output: { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

statement = "The Flintstones Rock"

# statement_letters = statement.chars.reject {|char| char == ' '}

# p statement_letters.each_with_object(Hash.new(0)) {|key, hash| hash[key] += 1}

letter_count = statement.chars.each_with_object(Hash.new(0)) do |key, hash| 
  binding.pry
  hash[key] += 1 unless key == ' '
end

p letter_count
# Is this solution not ideal because it does not permit access to the hash that contains the letter count?

# letter_total = {}

# statement.each_char do |letter|
#   letter_count = statement.count(letter)
#   letter_total[letter] = letter_count unless letter == ' '
# end

# p letter_total