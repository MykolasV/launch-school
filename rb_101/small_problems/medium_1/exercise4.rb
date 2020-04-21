def initialize_switches(number_of_switches)
  switches = {}
  1.upto(number_of_switches) { |num| switches[num] = 'off' }
  switches
end

def toggle_every_nth_switch(switches, nth)
  switches.each do |switch, state|
    if switch % nth == 0 && state == 'on'
      switches[switch] = 'off'
    elsif switch % nth == 0 && state == 'off'
      switches[switch] = 'on'
    end
  end

  switches
end

def on_switches(switches)
  switches.each_with_object([]) do |(switch, state), array|
    array << switch if state == 'on'
  end
end

def lights(number_of_switches)
  bank_of_switches = initialize_switches(number_of_switches)

  1.upto(bank_of_switches.size) do |nth|
    toggle_every_nth_switch(bank_of_switches, nth)
  end

  on_switches(bank_of_switches)
end

p lights(1000)
puts '-----'

# Further exploration:

def initialize_switches(number_of_switches)
  switches = Array.new
  1.upto(number_of_switches) { |num| switches << [num, 'off'] }
  switches
end

def toggle_every_nth_switch(switches, nth)
  switches.each_with_object([]) do |(switch, position), array|
    if switch % nth == 0 && position == 'on'
      array << [switch, 'off']
    elsif switch % nth == 0 && position == 'off'
      array << [switch, 'on']
    else
      array << [switch, position]
    end
  end
end

def switches(switches, state)
  switches.select { |switch| switch.include?(state) }.map(&:first)
end

def joinor(array)
  case array.size
  when 1 then array.first
  when 2 then "#{array.first} and #{array.last}"
  else "#{array[0..-2].join(', ')}, and #{array[-1]}"
  end
end

def format_round_display(bank_of_switches, state)
  if switches(bank_of_switches, state).size == 1
    if state == 'off'
      "light #{joinor(switches(bank_of_switches, state))} is now #{state};"
    else
      "light #{joinor(switches(bank_of_switches, state))} is #{state}."
    end
  else
    if state == 'off'
      "lights #{joinor(switches(bank_of_switches, state))} are now #{state};"
    else
      "lights #{joinor(switches(bank_of_switches, state))} are #{state}."
    end
  end
end

def display_round(bank_of_switches, round)
  return puts "- round 1: every light is turned on." if round == 1
  puts "- round #{round}: #{format_round_display(bank_of_switches, 'off')}" \
  " #{format_round_display(bank_of_switches, 'on')}"
end

def lights(number_of_switches)
  bank_of_switches = initialize_switches(number_of_switches)
  1.upto(bank_of_switches.size) do |nth|
    bank_of_switches = toggle_every_nth_switch(bank_of_switches, nth)
    display_round(bank_of_switches, nth)
  end

  puts ''
  switches(bank_of_switches, 'on')
end

p lights(3)
puts '-' * 80
p lights(10)
