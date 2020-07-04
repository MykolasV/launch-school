def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

puts '-----'

# Further exploration

def compute(element)
  block_given? ? yield(element) : "Does not compute #{element}."
end

p compute(5) { |num| num + 3 } == 8
p compute('a') { |letter| letter + 'b' } == 'ab'
p compute('fish') == 'Does not compute fish.'
