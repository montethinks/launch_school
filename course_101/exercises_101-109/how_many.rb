def count_occurrences(array)
  occurrences = Hash.new(0)

  array.size.times do |index|
    occurrences[array[index]] += 1
  end

  occurrences.each { |key, value| puts "#{key} => #{value}"}
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck',
            'motorcycle', 'motorcycle', 'car', 'truck']


p count_occurrences(vehicles)
