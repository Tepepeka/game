class HumanPlayer < Player

    attr_accessor :weapon_level

    def initialize(name_to_save)
        @weapon_level = 1
        super(name_to_save)
        @life_points = 100
    end

    def show_state
        puts self.life_points > 0? "#{self.name} with a weapon lvl @#{self.weapon_level} got #{self.life_points}hp!" : "#{self.name} with a weapon level @#{self.weapon_level} got 0hp!"
    end

    def compute_damage
        return rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_lvl = rand(1..6)
        puts "u find a weapon lvl @#{new_weapon_lvl}!"
        if new_weapon_lvl > @weapon_level
            puts "take this weapon!"
            return @weapon_level = new_weapon_lvl
        else
            puts "throw dat crappy weapon!"
            return @weapon_level
        end
    end

    def search_health_pack
        random_number = rand(1..6)
        if random_number == 1
            puts "u find nothing :(!"
        elsif random_number > 1 && random_number <= 5
            puts "u find a health pack @50hp"
            if @life_points + 50 >= 100
                return @life_points = 100
            else
                return @life_points = @life_points + 80
            end
        else
            puts "u find a health pack @80hp"
            if @life_points + 80 >= 100
                return @life_points = 100
            else
                return @life_points = @life_points + 80
            end
        end
    end

end