
answer = ''

loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase

  if answer.start_with?('y')
    puts "something"
    break
  elsif answer.start_with?('n')
    puts ""
    break
  else
    puts ">> Invalid input! Please enter 'y' or 'n' to continue."
  end
end