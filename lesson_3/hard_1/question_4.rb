def uuid_generator
  hex_range = [*0..9, *'a'..'f']
  sections = [8, 4, 4, 4, 12]
  uuid = []

  sections.each do |digit|
    digit.times do 
      uuid << hex_range.sample 
    end
    uuid << "-" 
  end

  uuid.pop
  uuid.join('')
end

p uuid_generator
p uuid_generator
p uuid_generator
p uuid_generator

# How do I add the dash on each section without adding it to the last section? How can I eliminate the .pop, .join at the end. 
# Can I use each with object, map, each with index for a better result?