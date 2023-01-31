require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

puts "ur name?"
print "> "
user_name = gets.chomp.to_s
user = HumanPlayer.new(user_name)

enemies = []
enemies << player1 = Player.new("Pif")
enemies << player2 = Player.new("Hercule")

while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    print user.show_state
    puts "Press enter"
    input = gets.chomp

    puts "W - Find a best weapon"
    puts "H - Find a health pack"
    puts "0 - #{player1.name} got 10hp!"
    puts "1 - #{player2.name} got 10hp!"
    puts "Select an action or someone to attack"
    print "> "
    selected = gets.chomp.to_s.upcase
    

    case selected
    when "W"
        user.search_weapon
    when "H"
        user.search_health_pack
    when "0"
        user.attacks(player1)
    when "1"
        user.attacks(player2)
    else
        puts "Select smthg"
    end
    
    puts "Press enter"
    input = gets.chomp

    
    enemies.each do |ennemy|
        if ennemy.life_points > 0 && user.life_points > 0
            puts "Enemies attack u"
            ennemy.attacks(user)
        end
    end

    puts "Press enter"
    input = gets.chomp


end

if user.life_points > 0 && player1.life_points <= 0 && player2.life_points <= 0
    puts "U WiN!"
else 
    puts "U LooSe!"
end