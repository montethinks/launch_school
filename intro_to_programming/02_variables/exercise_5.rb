x = 0
3.times do
  x += 1
end
puts x

puts "x will print '3' because the variable (x) was initialized in the outer scope. Variables initialized in the outer scope can be accessed inside the do/end block but if a new variable was initialized within the block it would not be accesible outside of that scope."

y = 0
3.times do
  y += 1
  x = y
end
#puts x

puts "x will result in an error of an undefined local variable or method because x was initialized within the scope of the do/end block. However, if we were to puts y then y would equal 3."