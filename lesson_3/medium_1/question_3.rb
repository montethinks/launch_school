# The result of the following statement will be an error:

# puts "the value of 40 + 2 is " + (40 + 2)
# Why is this and what are two possible ways to fix this?

# This is an error because (40 + 2) is not a string so it cannot be added to the string. This can be resolved either through string interpolation:
puts "the value of 40 + 2 is #{40 + 2}"

# or by converting the integer expression to a string:

puts "the value of 40 + 2 is " + (40 + 2).to_s 