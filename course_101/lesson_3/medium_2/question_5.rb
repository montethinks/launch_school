# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
p new_answer

# answer will output 34. The mess_with_it method is some_number = some_number + 8. The method has access to the number (answer) that is defined outside of the scope of the method and it returns the number + 8. however, this does not alter the original variable (answer) because the new variable was initialized inside of the method. This return number was saved as new_answer. The orinal answer variable was not modified so it answer (42) - 8 = 34. 