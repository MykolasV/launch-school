def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
puts '-----'

# Or:

def swap_name(name)
  first_name = name.split.first
  last_name  = name.split.last

  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
