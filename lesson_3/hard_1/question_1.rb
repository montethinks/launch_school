# What do you expect to happen when the greeting variable is referenced in the last line of the code below?

if false
  greeting = “hello world”
end

greeting

# nil will be returned because the variable greeting was initialized within the if block. The if block was never executed so the iniitalized variable will return nil. 