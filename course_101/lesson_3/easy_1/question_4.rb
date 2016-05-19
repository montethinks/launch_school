numbers = [1, 2, 3, 4, 5]

numbers.delete_at(1)

Deletes the element from the array and the index passed (1) as an argument to the method. Returns nil if the index passed is out of range (doesn't exist in the array)
The element, 2, would be deleted and the array returned would be [1, 3, 4, 5]

numbers.delete(1)

Deletes all instances of the integer 1 that is present in the element. If the element does not exist, nil is returned.

If called after the first expression this would return the array [3, 4, 5]. If not then all instances of 1 would be deleted leaving the array as [1, 2, 3, 4, 5]