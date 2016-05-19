# and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.



a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

# new_arr = a.map {|str| str.split}.flatten


# p new_arr

# Or the array can be mutated with the bang operator.

a.map! {|str| str.split}.flatten!    

p a