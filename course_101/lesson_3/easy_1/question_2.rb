# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios: 1. what is != and where should you use it? 2. put ! before something, like !user_name 3. put ! after something, like words.uniq! 4. put ? before something 5. put ? after something 6. put !! before something, like !!user_name

1. what is != and where should you use it? 

!= is 'not equal to' and is used when evaluating a boolean statement.

2. put ! before something, like !user_name 

! before this object will return the opposite boolean value and forces this statement to become a boolean value.  

3. put ! after something, like words.uniq! 

This is a bang operator and usually means that the method call will have a destructive action or will modify the object on which it is called. Specifically, uniq! would modify and array to remove all duplicate elements permanently.

4. put ? before something 

Will make a single character a string

5. put ? after something 

In this instance the ? is a ternary operator that is performing a boolean evaluation. For example boolean evaluation ? if true : else this if false.

6. put !! before something, like !!user_name

In this context it is forcing user_name into a boolean context and then negated so it would evaluate to "user_name is true"