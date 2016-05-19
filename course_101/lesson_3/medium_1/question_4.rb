# What happens when we modify an array while we are iterating over it? What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

#[3, 4] On the first loop each prints the first element 1, then the first element (1) is removed from the array and the next 

#It is not recommended that the original object be mutated / changed while looping as the results are unpredictable. 

What would be output by this code?

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end

[1, 2, 3, 4]
[4]
[3]

The pointer stops at 2 because it is at the end of the range. 

# Let's walk it through:

# You start out with numbers = [1, 2, 3, 4]

# On the first iteration, the first item (1) is printed, then the array is shifted (that is, the 1 is removed). That leaves numbers = [2, 3, 4].

# The each method, however, doesn't know that we removed the first number. It's still pointing to the first element in the array, which is 2.

# The block now returns to each, and each increments the pointer it uses to keep track of things. That pointer is now pointing to the 2nd element of numbers, which is currently 3. each calls the block with number equal to 3, so the p prints 3. The shift again removes the current first element (the 2), leaving numbers = [3, 4].

# Once again the block returns to each where the pointer is now pointing at the 2nd element of numbers, which is the now the last entry. each increments the pointer, which means it is now pointing beyond the end of numbers, so each terminates.

# Does this help?