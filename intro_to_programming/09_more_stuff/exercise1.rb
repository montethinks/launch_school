# Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word. - "laboratory" - "experiment" - "Pans Labyrinth" - "elaborate" - "polar bear"

# check to see if /lab/ exists in strings

# puts string if string =~ /lab/

def has_word(string)
  if string =~ /lab/
    puts "#{string} contains the word 'lab'."
  else
    puts "#{string} is not a match."
  end
end

has_word("laboratory")
has_word("experiment")
has_word("Pans Labyrinth")
has_word("elaborate")
has_word("polar bear")