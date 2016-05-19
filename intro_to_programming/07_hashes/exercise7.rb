x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

puts "my_hash is using the key 'x' as a symbol with a value of 'some value'. In my_hash2, the String 'hi there' is being used as a key for the value 'some value'. The output will be {:x => 'some value'} and {'hi there' => 'some value'}"
p my_hash
p my_hash2