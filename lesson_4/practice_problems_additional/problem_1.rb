flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = flintstones.each_with_object({}) do |str, hash|
                     hash[str] = flintstones.index(str)
                   end

p flintstones_hash

# Or:

flintstones_hash = {}

flintstones.each do |str|
  flintstones_hash[str] = flintstones.index(str)
end

p flintstones_hash

# Or:

flintstones_hash = {}

flintstones.each_with_index do |str, idx|
  flintstones_hash[str] = idx
end

p flintstones_hash

# Or:

flintstones_hash = {}
iterator = 0

loop do
  break if iterator == flintstones.size
  current_item = flintstones[iterator]
  flintstones_hash[current_item] = iterator
  iterator += 1
end

p flintstones_hash
