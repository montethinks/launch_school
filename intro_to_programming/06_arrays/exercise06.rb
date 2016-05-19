names = ['bob', 'joe', 'susan', 'margaret']
names['margaret'] = 'jody'

puts "Will cause an error because 'margaret' should be a number referencing the index of the value that is trying to be replaced with the String 'jody'."