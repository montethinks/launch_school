family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

# Gather immediate family names in one array using the select method.

# select brothers and sisters
immediate_relatives = family.select {|k,v| k == :sisters || k == :brothers}

# Make the hash of :sisters and :brothers one array.

immediate_relatives = immediate_relatives.values.flatten

immediate_relatives.each {|fam| puts fam}