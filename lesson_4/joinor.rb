require 'pry'

def joinor(arr, delimiter=', ', separator='or')
  arr[-1] = "#{separator} #{arr.last}" if arr.size > 1
  arr.join(delimiter)
end

p joinor([1])
p joinor([*0..9], ': ', 'and')
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"

# def joinor(arr, delimiter=', ', word='or')
#   arr[-1] = "#{word} #{arr.last}" if arr.size > 1
#   arr.join(delimiter)
# end

# Changing (mutating) the last element of the array into a string, interpolating the separator and calling the last array element. This will happen only if the array greater than 1. So if the array has more than one element then the last element will be changed. The array can then joined by the delimiter. Join will automatically produce the desired outcome. 

# First Try: 
# def joinor(arr, delimiter=',', separator='or')
#   arr[0..-2].join(delimiter + ' ').concat(', ' + separator + ' ' + arr.last.to_s)
# end