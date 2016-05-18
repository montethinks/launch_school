# Programmatically determine if 42 lies between 10 and 100.

# hint: Use Ruby's range object in your solution.
(10..100).include?(42)

if (10..100).include?(42)
  puts "42 is between 10 and 100."
else
  puts "42 is not in this range."
end

(10..100).cover?(42)