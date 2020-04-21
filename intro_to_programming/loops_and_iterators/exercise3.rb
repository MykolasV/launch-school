cities = ['London', 'Paris', 'Berlin', 'Moscow', 'New York']

cities.each_with_index { |city, idx| puts "#{idx + 1}. #{city}" }
