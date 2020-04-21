family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
          
new_arr = family.select do |k, v| 
  k == :brothers || k == :sisters
end 

immediate_family = new_arr.values.flatten

p immediate_family
