flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = 0

loop do
  break if flintstones[index][0..1] == 'Be'
  index += 1
end

p index

# Or:

result = nil
flintstones.each_with_index do |item, idx|
  result = idx if item[0..1] == 'Be'
end

p result

# Or:

p flintstones.bsearch_index { |str| str[0, 2] == 'Be' }

# Or:

p flintstones.index { |str| str[0..1] == 'Be' }
