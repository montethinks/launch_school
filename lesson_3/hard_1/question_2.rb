# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings

# The result will be "hi there". The greetings hash has been altered to by the shovel operator on line 5 so now the key :a has a value of 'hi there.' 

# 1. the greetings hash is initialized with one key-value pair; a: 'hi'
# 2. informal_greeting is initialized as string 'hi' by accessing the key :a.
# 3. informal_greeting (now 'hi') is being mutated by the shovel operator with the string ' there'. Since << is a destructive method call and a: and informal_greeting both point to 'hi' then the new string is 'hi there'.
# 4. greetings is now 'hi there'

