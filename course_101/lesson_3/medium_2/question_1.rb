munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}

male_age_total = 0

munsters.each do |name, stats|
  male_age_total += stats['age'] if stats['gender'] == 'male'
end

puts "The total ages of all of the males is #{male_age_total}"