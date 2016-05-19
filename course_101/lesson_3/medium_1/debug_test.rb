require 'pry'

statement = "The Flintstones Rock"

letter_count = statement.chars.each_with_object(Hash.new(0)) do |key, hash| 
  binding.pry
  hash[key] += 1 unless key == ' '
end

p letter_count
