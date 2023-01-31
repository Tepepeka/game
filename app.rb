require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

#binding.pry

player1 = Player.new("Pif")
player2 = Player.new("Hercule")


while player1.life_points > 0 && player2.life_points > 0
    puts player1.show_state
    puts player2.show_state

    puts "let's fight!"

    player2.attacks(player1)
    puts player1.show_state

    player1.attacks(player2)
    puts player2.show_state

    # Using Break Statement
    break if player1.life_points <= 0 || player2.life_points <= 0
end