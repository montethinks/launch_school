flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

# p flintstones = flintstones.select {|name| name == "Barney"}.to_a.flatten!

# flintstones = flintstones.delete_if { |name, number| name != "Barney" }
# p flintstones.to_a.flatten

# p flintstones.rassoc(2)

p flintstones.assoc("Barney")