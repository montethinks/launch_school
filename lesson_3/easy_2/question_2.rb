# add up all the ages of the munster family
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages = ages.values 
# age_total = ages.inject {|sum, age| sum + age}

# or 

p ages.values.inject(:+)