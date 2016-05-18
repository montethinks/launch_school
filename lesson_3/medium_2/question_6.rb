munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

p mess_with_demographics(munsters)
p munsters

# Did the family's data get ransacked, or did the mischief only mangle a local copy of the original hash? (why?)

# The family's data will be changed because within the method, the values of the hash munsters will be altered while iterating through the munsters hash. The values are reassigned while iterating through the hash and since the local variable is changing values defined outside of the scope of the method, the values are changed. 