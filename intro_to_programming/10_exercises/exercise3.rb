arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

all_odds = arr.select {|n| n.odd?}

p all_odds