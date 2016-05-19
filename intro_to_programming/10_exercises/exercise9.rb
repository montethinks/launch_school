h = {a:1, b:2, c:3, d:4}

# Get the value of the key b.

p h[:b]
h[:e] = 5
p h

h.delete_if {|k, v| v < 3.5}
p h