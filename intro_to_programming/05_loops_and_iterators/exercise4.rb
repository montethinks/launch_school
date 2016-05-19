# Write a method that counts down to zero using recursion.

def count_down(number)
  p number
  if number <= 0
    number
  else
    count_down(number - 1)
  end  
end

count_down(5)
count_down(-3)
count_down(20)