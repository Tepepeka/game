class Player

    attr_accessor :name, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10
    end

    def show_state
        puts self.life_points > 0? "#{self.name} got #{self.life_points}!" : "#{self.name} got 0!"
    end

    def gets_damage(dmg)
        @life_points -= dmg
        if @life_points <= 0
            puts "#{self.name} die! :o"
        end
    end

    def attacks(player)
        puts "#{self.name} attacks #{player.name}!"
        rand_dmg = compute_damage
        player.gets_damage(rand_dmg)
        puts "#{self.name} make #{rand_dmg}dmg!"
    end
 
    def compute_damage
        return rand(1..6)
    end

end