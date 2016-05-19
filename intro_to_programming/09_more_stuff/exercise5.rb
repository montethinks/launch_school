# def execute(block)
#   block.call
# end

# execute { puts "Hello from inside the execute method!" }

This code will give an ArgumentError because the method is not expecting a block of code as an argument but it is expecting another object. It would need an '&' to work.