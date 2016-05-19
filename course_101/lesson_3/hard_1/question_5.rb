def is_a_number?(str)
  str.to_i.to_s == str
end

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
      
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_a_number?(word)
    break
  end
  true
end

p dot_separated_ip_address?('10.80.8.76')
p dot_separated_ip_address?("testing 1.2.3")
p dot_separated_ip_address?("1.2.3.4.5")
p dot_separated_ip_address?("4.5.5")

# How can I handle IP addresses that are less than 4? Need to check the size of the array after the split and end the program if it is less than 4.