person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

#has_value?

def value_check(group, val)
  if group.has_value?(val)
  puts "The value you seek is present."
  else
  puts "There is no such value."
  end
end

