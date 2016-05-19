def prompt(message)
  puts "=> #{message}"
end

prompt("Hello and welcome to the mortgage calculator! Let's get started!")

prompt("***************")

loop do 
  prompt("Please enter your loan amount:")

  loan_amount = ''
  loop do 
    loan_amount = gets().chomp()
    
    if loan_amount.empty?() || loan_amount.to_i() < 0
      prompt("Please enter your loan amount using a positive number.")
    elsif loan_amount.to_i().to_s() != loan_amount
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  prompt("What is your interest rate?")
  prompt("(Please enter 6 for 6% or 4.75 for 4.75%)")

  interest_rate = ''
  loop do 
    interest_rate = gets().chomp()

    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Please enter a positive number for your interest rate.")
    elsif interest_rate.to_i().to_s() != interest_rate
      prompt("Please enter a numerical interest rate.")  
    else
      break
    end
  end

  prompt "What is the duration of the loan (in years)?"

  years = ''
  loop do 
    years = gets().chomp()

    if years.empty?()
      prompt("Please enter the duration of your loan based on the years.")
    elsif years.to_i().to_s() != years
      prompt("Please enter years as a number. For example: enter '30' for 30 years.")      
    else
      break
    end
  end

  annual_percentage_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_percentage_rate / 12

  loan_months = years.to_i() * 12


  monthly_payment = loan_amount.to_f() * 
                    (monthly_interest_rate * 
                    ((1 + monthly_interest_rate) ** loan_months) ) / 
                    (((1 + monthly_interest_rate) ** loan_months ) - 1) 

  prompt("Your monthly payment is $#{monthly_payment.round(2)}")

  prompt("Would you like to perform another calculation? Y/n")
  response = gets().chomp()

  break unless response.downcase().start_with?('y')
end

