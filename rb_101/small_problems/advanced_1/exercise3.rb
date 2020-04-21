def transpose(matrix)
  result = [[], [], []]
  matrix.each do |arr|
    arr.each_with_index do |el, idx|
      result[idx] << el
    end
  end
  result
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts '-----'

# Given solution:

def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

new_matrix = transpose(matrix)
p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
puts '-----'

# Further exploration:

def transpose!(matrix)
  matrix_copy = matrix.dup
  matrix.map!.with_index do |arr, column_index|
    arr.map.with_index do |_, row_index|
      matrix_copy[row_index][column_index]
    end
  end
end

p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
transpose!(matrix)
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
