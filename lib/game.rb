class Game
    #Crée la classe `Game` qui aura 2 `attr_accessor` : un `@human_player` de type `HumanPlayer` et 
    #un array `@enemies` qui contiendra des `Player`.
    attr_accessor :human_player, :enemies


    #Un objet `Game` s'initialise ainsi : `my_game = Game.new("Wolverine")`. Il crée automatiquement 4 `Player` 
    #qu'il met dans `@enemies` et un `HumanPlayer` portant (dans cet exemple) le nom "Wolverine".
    def initialize(name)
        @enemies = []
        enemies_name = ["Pif","Hercule","Diabolo","Satanas"]
        enemies_name.each do |enemy|
            @enemies << Player.new(enemy)
        end
        @human_player = HumanPlayer.new(name)
    end

    #prend un objet `Player` en entrée et le supprime de `@enemies`. Cette méthode permet d'éliminer un adversaire tué.
    def kill_player(player)
        @enemies.delete(player)
    end

    #retourne true si le jeu est toujours en cours et false sinon. Le jeu continue tant que 
    #le `@human_player` a encore des points de vie et qu'il reste des `Player` à combattre dans l’array `@enemies`.
    def is_still_ongoing?
        return @human_player.life > 0 || @enemies.empty? == false
    end

    #afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
    def show_players
        puts "#{@human_player.name} got #{@human_player.life_points}"
        puts "Still #{@enemies.count} bot(s)"
    end

    #afficher le menu de choix (juste l'afficher, pas plus). On a les mêmes choix que dans la version 2.0 
    #à la seule différence qu'il y a plus de 2 ennemis à combattre et que si un ennemi est mort,
    #on ne doit plus proposer de l'attaquer.
    def menu
        puts "Select an action"
        puts "W - Find a best weapon"
        puts "H - Find a health pack"
        puts "Attack an ennemy"
        @enemies.count.times do |i|
            if @enemies[i].life_points > 0
                puts "#{i}_#{@enemies[i].name}"
            end
        end
        puts "Select an action or someone to attack"
        print "> "
    end

    #prend en entrée un string. Cette méthode va permettre de faire réagir le jeu en fonction du choix,
    #dans le menu, de l'utilisateur. Par exemple, si l'entrée est "a", le `@human_player` doit aller chercher une arme.
    #Si l'entrée est "0", on le fait attaquer l'ennemi présenté au choix "0", etc. 
    #Pense à faire appel, dans cette méthode, à la méthode `kill_player` 
    #si jamais un `Player` est tué par le joueur humain !
    def menu_choice(selected)
        case selected
        when "W"
            @human_player.search_weapon
        when "H"
            @human_player.search_health_pack
        when selected 
            @human_player.attacks(@enemies[selected.to_i])
        else
            puts "Select smthg"
        end
    end

    #va faire riposter tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain.
    def enemies_attack
        @enemies.each do |enemy|
            if enemy.life_points > 0 && @human_player.life_points > 0
            enemy.attacks(@human_player)
            else
            kill_player(ennemy)
            end
        end
    end

    def clear_shell
        system('clear')
    end

    def end
        if @human_player.life_points > 0 && @enemies.empty? == true
            puts "U WiN!"
        else
            puts "U LoOSe!"
        end
    end

end