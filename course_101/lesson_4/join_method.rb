def joinor(array, delimiter=', ', separator='or')
  array[-1] = "#{separator} #{array.last}" if array.size > 1
  array.join(delimiter) 
end

p joinor([1])
p joinor([1, 2, 3])                # => "1, 2, or 3"
p joinor([1, 2, 3], '; ')          # => "1; 2; or 3"
p joinor([1, 2, 3], ', ', 'and')   # => "1, 2, and 3"