1. game_counter = {player: 0, computer: 0, tie: 0}
2. Add win for whomever won the game

if someone_won == 'Player'
  game_counter[:player] += 1
elsif someone_won == 'Computer'
  game_counter[:computer] += 1
else
  game_counter[:tie] += 1
end

3. Check to see if either has 5 total

total = game_counter.select { |player| game_counter[player] = 5}

if total.empty?
  keep playing
elsif "It's a tie!"
  "It has been a tie 5 times. Game over."
    
else
  "#{person} has won 5 games. Game over."
end

Could say that count_games is a method that will pass in the winner from detect winner into the method that adds to the game total. 