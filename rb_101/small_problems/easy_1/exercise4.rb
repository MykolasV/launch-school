def count_occurrences(arr)
  # arr = arr.map(&:downcase)      (Further Exploration)
  occurances = []
  words = arr.uniq

  arr.each do |el|
    occurances << arr.count(el)
  end

  occurances.uniq!

  idx = 0
  until idx == (words.size)
    puts "#{words[idx]} => #{occurances[idx]} "
    idx += 1
  end

end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
