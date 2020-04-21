BLOCKS = { 'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A',
           'G' => 'T', 'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U',
           'V' => 'I', 'L' => 'Y', 'Z' => 'M' }

def block_word?(word)
  result = true
  letters = word.upcase.chars

  BLOCKS.each do |key, value|
    if letters.include?(key) && letters.include?(value) ||
       letters.count(key) >= 2 || letters.count(value) >= 2
      result = false
    end
  end

  result
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bbbbbatch') == false
p block_word?('bbbbbotch') == false
puts '-----'

# Or:

BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(word)
  return 'Invalid input.' if word.to_s != word

  BLOCKS.each do |block|
    counter = 0
    block.each do |letter|
      word.chars.each do |char|
        counter += 1 if letter == char.upcase
      end
      return false if counter >= 2
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bbbbbatch') == false
p block_word?('bbbbbotch') == false
puts '------'

# Given solution:

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
p block_word?('bbbbbatch') == false
p block_word?('bbbbbotch') == false
