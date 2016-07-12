require 'pry'

SUITS = ['spades', 'clubs', 'hearts', 'diamonds']
CARD_VALUES = [*'2'..'10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  CARD_VALUES.product(SUITS).shuffle
end

def deal(deck, player_hand, dealer_hand)
  2.times do |_|
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def display_cards(player_hand)
  cards = []

  player_hand.each { |card| }
end

def card_total(cards)
  card_values = cards.map { |card| card[0] }

  total = 0
  card_values.each do |value| 
    if value == "A"
      total += 11 
    elsif value.to_i == 0 # jack, queen, king
      total += 10
    else
      total += value.to_i
    end
  end
  total

  card_values.count("A").times do |_|
    total -= 10 if total > 21
  end
  total
end

def hit!(deck, player_hand)
  player_hand << deck.pop
end

def busted?(player_hand)
  return true if card_total(player_hand) > 21
end

def detect_winner(player_hand, dealer_hand)
  player = card_total(player_hand)
  dealer = card_total(dealer_hand)

  if player > dealer
    return 'Player'
  else
    return'Dealer'
  end
end

def display_winner(hand1, hand2)
  player = card_total(hand1)
  dealer = card_total(hand2)

  if player > dealer
    puts "You won!"
  else 
    puts "Dealer won."
  end  
end

# Start Game
prompt "Welcome to Twenty One!"

deck = initialize_deck
player_hand = []
dealer_hand = []
deal(deck, player_hand, dealer_hand)

prompt "Dealer has #{dealer_hand[0]} and ???."
prompt "You have #{player_hand[0]} and #{player_hand[1]} for a total of #{card_total(player_hand)}."
# Player turn 

answer = nil
loop do 
  prompt "Would you like to hit or stay?"
  answer = gets.chomp
  break if answer.start_with?('s') 

  hit!(deck, player_hand) #if answer.start_with?('h')
  prompt "You now have: #{player_hand.inspect}"
  prompt "Your total is: #{card_total(player_hand)}."

  break if busted?(player_hand)
end

if busted?(player_hand)
  puts "Player: #{player_hand.inspect}"
  puts "Total: #{card_total(player_hand)}"
  puts "You busted. Dealer wins."
  puts "Dealer: #{dealer_hand.inspect}"
else
  puts "You chose to stay."
end

# Dealer's turn 

# If dealer stays display 'dealer' and display total.
# If dealer hits, display cards
# Display dealer total

loop do 
  prompt "Dealer turn..."
  break if card_total(dealer_hand) >= 17
  prompt "Dealer hits!"
  prompt "Dealer has #{dealer_hand.inspect}"

  hit!(deck, dealer_hand) if card_total(dealer_hand) < 17
  prompt "Total is #{card_total(dealer_hand)}"
  break if busted?(dealer_hand)
end

# Add features:
# - Compare cards
# - Declare (display) winner

p detect_winner(player_hand, dealer_hand)






