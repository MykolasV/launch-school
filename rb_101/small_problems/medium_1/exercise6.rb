def integer?(input)
  input.to_i.to_s == input
end

def minilang(str)
  stack = []
  register = 0
  sub_strings = str.split(' ')

  iterator = 0
  loop do
    break if iterator > sub_strings.size
    current_sub_str = sub_strings[iterator]

    if integer?(current_sub_str)
      register = current_sub_str.to_i
    else
      operation = current_sub_str
    end

    case operation
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    end

    iterator += 1
  end
end

minilang('PRINT')
# 0
puts '-----'
minilang('5 PUSH 3 MULT PRINT')
# 15
puts '-----'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts '-----'
minilang('5 PUSH POP PRINT')
# 5
puts '-----'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts '-----'
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts '-----'
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts '-----'
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts '-----'
minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts '-----'
puts ''

# Gven solution:

def minilang(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
end

minilang('PRINT')
# 0
puts '-----'
minilang('5 PUSH 3 MULT PRINT')
# 15
puts '-----'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8
puts '-----'
minilang('5 PUSH POP PRINT')
# 5
puts '-----'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7
puts '-----'
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6
puts '-----'
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12
puts '-----'
minilang('-3 PUSH 5 SUB PRINT')
# 8
puts '-----'
minilang('6 PUSH')
# (nothing printed; no PRINT commands)
puts '-----'
puts ''

# Further exploration:

# (3 + (4 * 5) - 7) / (5 % 3)

minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH -7 ADD PUSH POP DIV PRINT')
puts ''

# error handling:

def valid_program?(program)
  program.all? do |token|
    %w(ADD DIV MULT MOD SUB PUSH POP PRINT).include?(token) ||
    token.to_i.to_s == token
  end
end

def minilang(program)
  stack = []
  register = 0
  program = program.split
  return puts 'Error found. Check the input!' if !valid_program?(program)

  program.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end

  nil
end

minilang('4 PUSH PUSH 7 MOD MULT PRINT')
puts '-----'
minilang('INVALID 4 PUSH PUSH 7 MOD MULT PRINT')
