class Game
    #Crée la classe `Game` qui aura 2 `attr_accessor` : un `@human_player` de type `HumanPlayer` et 
    #un array `@enemies` qui contiendra des `Player`.
    attr_accessor :
    attr_accessor :


    #Un objet `Game` s'initialise ainsi : `my_game = Game.new("Wolverine")`. Il crée automatiquement 4 `Player` 
    #qu'il met dans `@enemies` et un `HumanPlayer` portant (dans cet exemple) le nom "Wolverine".
    def initialize
        my_game = Game.new("Wolverine")
    end

    def kill_player
       #prend un objet `Player` en entrée et le supprime de `@enemies`. Cette méthode permet d'éliminer un adversaire tué.
    end

    def is_still_ongoing?
        #retourne true si le jeu est toujours en cours et false sinon. Le jeu continue tant que 
        #le `@human_player` a encore des points de vie et qu'il reste des `Player` à combattre dans l’array `@enemies`.
    end

    def show_players
        #afficher 1) l'état du joueur humain et 2) le nombre de joueurs "bots" restant
    end

    def menu
        #afficher le menu de choix (juste l'afficher, pas plus). On a les mêmes choix que dans la version 2.0 
        #à la seule différence qu'il y a plus de 2 ennemis à combattre et que si un ennemi est mort,
        #on ne doit plus proposer de l'attaquer.
    end

    def menu_choice
        #prend en entrée un string. Cette méthode va permettre de faire réagir le jeu en fonction du choix,
        #dans le menu, de l'utilisateur. Par exemple, si l'entrée est "a", le `@human_player` doit aller chercher une arme.
        #Si l'entrée est "0", on le fait attaquer l'ennemi présenté au choix "0", etc. 
        #Pense à faire appel, dans cette méthode, à la méthode `kill_player` 
        #si jamais un `Player` est tué par le joueur humain !
    end

    def enemies_attack
        #va faire riposter tous les ennemis vivants. Ils vont attaquer à tour de rôle le joueur humain.
    end

    def end
        #va effectuer l'affichage de fin de jeu. Tu sais, la partie "le jeu est fini" puis "Bravo..." ou "Loser..."
    end

end