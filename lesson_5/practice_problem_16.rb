require 'securerandom'

def generate_uuid
  SecureRandom.uuid
end

puts generate_uuid
puts '-----'

# Or:

def hex_chars(length)
  result = []
  chars = ('a'..'f').to_a | (0..9).to_a

  length.times { |idx| result << chars.shuffle[idx] }
  result.join
end

def generate_uuid
  "#{hex_chars(8)}-#{hex_chars(4)}-#{hex_chars(4)}-#{hex_chars(4)}-#{hex_chars(12)}"
end

puts generate_uuid
puts '-----'

# Given solution:

def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

puts generate_UUID
