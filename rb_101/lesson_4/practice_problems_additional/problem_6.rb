flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

iterator = 0
loop do
  break if iterator == flintstones.size
  flintstones[iterator] = flintstones[iterator][0, 3]
  iterator += 1
end

p flintstones

# Or:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! { |name| name[0, 3] }
p flintstones

# Or:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

p flintstones.each_with_object([]) { |name, a| a << name[0, 3] }

# Or:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each { |name| name.delete_suffix!(name[3..-1]) }
p flintstones
