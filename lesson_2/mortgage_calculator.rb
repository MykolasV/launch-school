require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  (num.to_i().to_s() == num && num.to_i > 0) || (num.to_f().to_s() == num &&
  num.to_f > 0)
end

prompt(MESSAGES['welcome'])

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}! Please give us some information about your loan.")

loop do
  prompt(MESSAGES['amount'])

  loan_amount = ''
  loop do
    loan_amount = Kernel.gets().chomp()
    if valid_number?(loan_amount)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['apr'])

  apr = ''
  loop do
    apr = Kernel.gets().chomp()
    if valid_number?(apr)
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  prompt(MESSAGES['duration'])

  duration_in_years = ''
  loop do
    duration_in_years = Kernel.gets().chomp()
    if valid_number?(duration_in_years) &&
       duration_in_years.to_f.to_s != duration_in_years
      break
    else
      prompt(MESSAGES['valid_number'])
    end
  end

  monthly_interest_rate = (apr.to_f / 100) / 12
  duration_in_months = duration_in_years.to_i * 12

  loan_amount = if loan_amount.to_i().to_s() == loan_amount
                  loan_amount.to_i()
                else
                  loan_amount.to_f()
                end

  monthly_payment = loan_amount * (monthly_interest_rate / (1 -
                    (1 + monthly_interest_rate)**(-duration_in_months)))

  prompt("The monthly payment for your loan is going to be \
£#{monthly_payment.round(2)}.")

  prompt(MESSAGES['another_calculation'])
  answer = Kernel.gets().chomp()

  if !answer.downcase.start_with?('y')
    prompt(MESSAGES['bye'])
    break
  end
end
