puts '=> Whats is the bill?'
bill = gets.chomp.to_f

puts '=> What is the tip percentage?'
tip = gets.chomp.to_f

tip_amount = (tip * bill) / 100
total      = bill + tip_amount

puts "=> Tip is $#{format('%02.2f', tip_amount)}"
puts "=> The total is $#{format('%02.2f', total)}"
