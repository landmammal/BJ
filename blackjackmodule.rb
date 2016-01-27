module BlackjackModule





  def choice(player_sum, dealer_sum, deck) #define choice method

     puts " 'hit' or 'stay'?"
     response = gets.chomp.strip
     case response
     when "hit"
       hit_one(player_sum, dealer_sum, deck)
     when "stay"
       evaluate(player_sum, dealer_sum, deck)
     else
       puts "choose from 'hit' or 'stay'!!!"
       choice(player_sum, dealer_sum, deck)
     end
  end


  def gettingace(player_sum, dealer_sum, deck)
    puts "nice. looks like you got an ace!"
    puts "choose your value 1 or 11?"
    userinput=gets.chomp
    if userinput==1
      player_sum=player_sum-10
      choice(player_sum, dealer_sum, deck)
    else
      choice(player_sum, dealer_sum, deck)
    end
  end



  def hit_one(player_sum, dealer_sum, deck) # define hit method

      new_card=deck[0]
      deck.shift

      player_sum = new_card + player_sum
      puts
      puts "you said hit!"
      puts "new card is #{new_card}"
      puts "your new total is #{player_sum}"
      puts

      if player_sum == 21
        puts
        puts "nice hit! black jack!"
        puts
        `afplay cheering.mp3`
      elsif new_card==11
        gettingace(player_sum, dealer_sum, deck)
      elsif player_sum < 21
        choice(player_sum, dealer_sum, deck)
      else
        bust
      end
  end


  def bust #define bust method
    puts "I am sorry. its bust 😖 😟"
  puts "

  @@@@@@@@@@@  @@@@@@@@@@@  @@@@@@@@@@@@@@@@@f :@@@@@@@@@@i        @@@@@@@@@@@  @@@@; f@@@@  @@@@@@@@@@@. @@@@@@@@@@@
  @@@@8. ......@@@@C..@@@@. @@@@f.:@@@@  @@@@f.:@@@@  ..  . . .   .@@@@;.t@@@@  @@@@; f@@@@ .@@@@,....    @@@@. 0@@@@...
  @@@@8;@@@@@..@@@@@@@@@@@..@@@@f.;@@@@..@@@@f.;@@@@@@@............@@@@;.t@@@@..@@@@;.f@@@@..@@@@@@@G.....@@@@@@@@@@......
  @@@@8..@@@@..@@@@C..@@@@..@@@@f.;@@@@..@@@@f.;@@@@...............@@@@;.t@@@@..@@@@;.f@@@@..@@@@,........@@@@..0@@@@.....
  @@@@@@@@@@@..@@@@C..@@@@..@@@@f.;@@@@..@@@@f.;@@@@@@@@@@i........@@@@@@@@@@@..@@@@@@@@@@@..@@@@@@@@@@@..@@@@..0@@@@.....

  "
  `afplay evil.mp3`
  end





  def dealer_hit(player_sum, dealer_sum, deck) #dealer hitting until its over 17
    dealer_new_card = deck[0] # deals one card to dealer
    deck.shift
    dealer_sum = dealer_sum + dealer_new_card
    puts
    puts "dealer's new card is #{dealer_new_card}"
    puts "dealer total is #{dealer_sum}"
    sleep(1)
    puts

    evaluate(player_sum, dealer_sum, deck)
  end



  def evaluate(player_sum, dealer_sum, deck)
    if dealer_sum >= 22

      puts "dealer bust! you win!👍"
      `afplay cheering.mp3`
    elsif dealer_sum < 17

      puts "dealer total is: #{dealer_sum}."
      puts "dealer deals one more card"
      puts
      dealer_hit(player_sum, dealer_sum, deck)

    elsif player_sum > dealer_sum

      puts "Your total:#{player_sum}"
      puts "Dealer total: #{dealer_sum}"
      puts "you won!"
      `afplay cheering.mp3`
    elsif player_sum < dealer_sum
      puts "Your total:#{player_sum}"
      puts "Dealer total: #{dealer_sum}"
      puts "thus Dealer wins😖 😟"

      `afplay evil.mp3`
    else
      puts "push!"
    end
  end

end
