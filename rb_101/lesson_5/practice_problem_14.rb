hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

result = []

hsh.each_value do |details|
  result << details[:colors].map(&:capitalize) if details.has_value?('fruit')
  result << details[:size].upcase if details.has_value?('vegetable')
end

p result
puts '-----'

# Or:

result = hsh.each_with_object([]) do |(_, details), array|
  array << details[:colors].map(&:capitalize) if details.has_value?('fruit')
  array << details[:size].upcase if details.has_value?('vegetable')
end

p result
puts '-----'

# Given solution:

result = hsh.map do |_, value|
  if value[:type] == 'fruit'
    value[:colors].map do |color|
      color.capitalize
    end
  elsif value[:type] == 'vegetable'
    value[:size].upcase
  end
end

p result
