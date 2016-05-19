arr = ['Monica', 'Marlana', 'Monte', 'Mara', 'Mary']

arr.each_with_index do |value, index|
  puts "#{index + 1}. #{value}"
end