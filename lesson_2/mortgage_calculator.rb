require 'yaml'
MESSAGES = YAML.load_file('mortgage_calculator_messages.yml')

def clear
  system('clear') || system('cls')
end

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  (num.to_i.to_s == num && num.to_i > 0) || (num.to_f.to_s == num &&
  num.to_f > 0)
end

def retrieve_amount
  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      return loan_amount
    else
      prompt(MESSAGES['valid_number'])
    end
  end
end

def retrieve_apr
  loop do
    apr = gets.chomp
    if valid_number?(apr)
      return apr
    else
      prompt(MESSAGES['valid_number'])
    end
  end
end

def retrieve_duration
  loop do
    duration_in_years = gets.chomp
    if valid_number?(duration_in_years) &&
       duration_in_years.to_f.to_s != duration_in_years
      return duration_in_years
    else
      prompt(MESSAGES['valid_number'])
    end
  end
end

def retrieve_name
  loop do
    name = gets.chomp
    if name.empty? || name.start_with?(' ') || name.end_with?(' ')
      prompt(MESSAGES['valid_name'])
    else
      return name
    end
  end
end

clear

prompt(MESSAGES['welcome'])

prompt(format(MESSAGES['ask_for_info'], name: retrieve_name))

loop do
  prompt(MESSAGES['amount'])

  loan_amount = retrieve_amount

  clear

  prompt(MESSAGES['apr'])

  apr = retrieve_apr

  clear

  prompt(MESSAGES['duration'])

  duration_in_years = retrieve_duration

  clear

  monthly_interest_rate = (apr.to_f / 100) / 12
  duration_in_months = duration_in_years.to_i * 12

  loan_amount = if loan_amount.to_i.to_s == loan_amount
                  loan_amount.to_i
                else
                  loan_amount.to_f
                end

  monthly_payment = loan_amount * (monthly_interest_rate / (1 -
                    (1 + monthly_interest_rate)**(-duration_in_months)))

  monthly_payment = monthly_payment.round(2)

  clear

  prompt(format(MESSAGES['monthly_payment'], amount: monthly_payment))

  puts('---------------'.center(60))

  prompt(MESSAGES['another_calculation'])
  answer = gets.chomp.downcase

  until answer == 'y' || answer == 'n'
    prompt(MESSAGES['y_or_n'])
    answer = gets.chomp
  end

  if answer == 'n'
    prompt(MESSAGES['bye'])
    break
  end

  clear
end
