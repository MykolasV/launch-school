# class SecretHandshake
#   def initialize(input)
#     @number = if input.is_a?(Integer)
#                 decimal_to_binary(input)
#               else
#                 valid_binary?(input) ? input.to_i : 0
#               end
#     @number_length = @number.to_s.size
#   end

#   def commands
#     number = @number_length > 4 ? @number.to_s[-4..-1].to_i : @number

#     result = []
#     while number > 0
#       if number / 1000 > 0
#         result.prepend('jump')
#         number -= 1000
#       elsif number / 100 > 0
#         result.prepend('close your eyes')
#         number -= 100
#       elsif number / 10 > 0
#         result.prepend('double blink')
#         number -= 10
#       elsif number % 10 > 0
#         result.prepend('wink')
#         number -= 1
#       end
#     end

#     @number_length > 4 ? result.reverse : result
#   end

#   private

#   def valid_binary?(input)
#     !input.match?(/[^01]/)
#   end

#   def decimal_to_binary(number)
#     binary = []
#     while number > 0
#       number, remainder = number.divmod(2)
#       binary.prepend(remainder)
#     end

#     binary.join.to_i
#   end
# end

# Or

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump', 'reverse']

  def initialize(input)
    @binary_chars = parse(input).chars
  end

  def commands
    selected = []
    @binary_chars.reverse.each_with_index do |char, index|
      selected << COMMANDS[index] if char == '1'
    end

    selected.last == 'reverse' ? selected[0..-2].reverse : selected
  end

  private

  def parse(input)
    if input.is_a?(Integer)
      decimal_to_binary(input)
    else
      valid_binary?(input) ? input : '0'
    end
  end

  def valid_binary?(input)
    !input.match?(/[^01]/)
  end

  def decimal_to_binary(number)
    number.to_s(2)
  end
end
