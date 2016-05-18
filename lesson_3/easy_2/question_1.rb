ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# see if there is an age present for "Spot".

ages.has_key?("Spot")
ages.include?("Spot")
ages.any? {|key, value| key == "Spot"}
ages.member?("Spot")
ages.key?("Spot")