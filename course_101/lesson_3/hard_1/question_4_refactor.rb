def uuid_generator
  hex_range = [*0..9, *'a'..'f']
  sections  = [8, 4, 4, 4, 12]
  uuid      = []

  sections.each_with_index do |digit, index|
    digit.times do 
      uuid << hex_range.sample 
    end
    uuid << "-" unless index >= sections.size - 1
  end
    uuid.join('')
end

p uuid_generator
p uuid_generator
