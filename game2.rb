require_relative "./blackjackmodule.rb"
include BlackjackModule

puts <<END



@@@@ 8@@@ @;  @@@@@      CG1        .;i:         ,@@@Gt     , @;,      @0     8i          @;.       : G@@.;,      G..
     @@@i.@   :@@@@@   @ @@@       @@ @@L     G@@@@         @,@@0    @     0@C@@       8@i@@@    i;@@@@:        @ @@@    @G
    ,@@@.@8   @@@@@f   @0@@@      @ @.@@@    @@@@8         C@C@@   @G      @@8@@      8f@@@@@    @@@@@        @ @.@@0  0i
    @@@@ @. f@@@@C    .:@@@;     @i @@@@@   @@@@@          @@@@@ @@        @@@@@     0@ 8@@@@   @@@@@          t@@@@ 00:
    @@@0@@ @@@@@0     8@@@@     @1  @@@@@  f@@@@f         ,@@@@@8         ;@@@@,    0@  1@@@@f  @@@@@          @@@@@@.
   1@@@i@i   @@@@@G   @@@@@    @1   @@@@@  :@@@@L         @@@@@ @@@@      @@@@@    G@   .@@@@8  @@@@8         .@@@8i@@@@:
   @@@@@@    0@@@@@  .@@@@.   8@@@@@@@@L@L  @@@@@         @@@.8 t@@@@     @@@@@   @@@@@@@@@@L@  @@@@@       @.@@@@@  @@@@
   @@@@ 8    @@@@@@  @@@G@   C@     :@@L18   8@@@@    8  C@@GC   @@@:0   ,@@@@.  @@      @@@ @    @@@@    @   @@@ 0  1@@@@
  8@@@if.  @@@@@@.   @@@ @@@@@@      @@0 @      G@@ 80   1f@ @    @ G:   @@@@@ ;@@      ,@@@ C       t@@@;   f@@iC    @@@:.
  @@@@ L@@@@f,                                                      .    @@@@@                                         @ ,@
 .@@@                                                               @   C@@@@
 @@@f                                                               C0@@.@@1

created by Brian Kim rev2.0


END

#intro
puts "Lets Play BlackJack!!😎 😎"
puts "[Dealer shuffles...]"
sleep(0.5)

#initiate the game
deck=[1,2,3,4,5,6,7,8,9,10,10,10,10,11,
  1,2,3,4,5,6,7,8,9,10,10,10,10,11,
  1,2,3,4,5,6,7,8,9,10,10,10,10,11,
  1,2,3,4,5,6,7,8,9,10,10,10,10,11].shuffle


#creating empty array for player and dealer
player_card=[]
dealer_card=[]

2.times {player_card.push(deck[0]) #dealing first 2 cards to player
deck.shift}


2.times { dealer_card.push(deck[0]) #dealing 2 cards to the dealer
deck.shift }

player_sum=player_card[0]+player_card[1] # players total sum
dealer_sum=dealer_card[0]+dealer_card[1] # dealers total sum



puts "Your hand is #{player_card}"
puts "Dealer's open card is #{dealer_card[0]}"
puts


# initial loop 1
if player_sum == 21 #getting blackjack
  puts "Congratulation! you got BlackJack!!👍"
  `afplay cheering.mp3`
elsif player_sum > 21
  player_sum=player_sum-10 #getting two Aces
else
  choice(player_sum, dealer_sum, deck) # ask a player for a choice
end
