flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# Turn this array into a hash where the names are the keys and the values are the positions in the array.
new_hash = {}

flintstones.each_with_index {|name, index| new_hash[name] = index}

p new_hash
