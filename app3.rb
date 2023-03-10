require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/human_player'

puts "ur name?"
print "> "
name = gets.chomp.to_s
@my_game = Game.new(name)

#@my_game loop

while @my_game.human_player.life_points > 0 && @my_game.enemies.count > 0
    @my_game.show_players
    @my_game.menu
    selected = gets.chomp
    @my_game.clear_shell
    @my_game.menu_choice(selected)
    @my_game.enemies_attack
end

@my_game.end

#binding.pry

=begin
#### c) Quelques fonctionnalités en plus

On aimerait bien que notre Fornite-like permette de combattre 10 ou 20 ennemis sur une même partie... Mais s'ils débarquent tous dès le début et s'acharnent sur notre pauvre `HumanPlayer`, même avec ses habilités spéciales il va pas durer longtemps.

On va mettre en place un système où les ennemies vont débarquer au compte-goutte, un peu comme dans les jeux où on tombe sur eux au hasard de tes déplacements sur la carte. Pour ça, on va suivre à la fois le nombre d'ennemis toujours présents dans le jeu ( = ennemis restant à éliminer) et le nombre d'ennemis qui sont "en vue" (= ennemis qu'on peut attaquer et qui peuvent nous attaquer en retour). Voilà comment on va faire dans la classe `Game` :

- Rajoute deux attributs : `@players_left` qui est un integer qu'on initialize à 10 et `@enemies_in_sight` qui vient remplacer `@enemies` et qui est un array vide au départ. Tu l'as compris car j'ai bien nommé mes variables (prends en de la graine) : `@players_left` représente le nombre de joueur restant dans le jeu (= nombre restant à éliminer pour gagner) et `@enemies_in_sight` est un array de `Player` qui sont ceux en vue (= qu'on peut attaquer et qui vont nosu attaquer en retour).
- Modifie la méthode `is_still_ongoing?` pour que le jeu continue tant que notre `HumanPlayer` est toujours en vie et qu'il n'est pas le dernier vivant.
- Crée une méthode `new_players_in_sight` qui va avoir pour rôle de rajouter des ennemis en vue. Voici les règles de fonctionnement de cette méthode :

- Si tous les joueurs du jeu sont déjà "en vue", on ne doit pas en rajouter. Dans ce cas, cela signifie que le nombre d'objets `Player` dans `@enemies_in_sight` est égal à l'integer `@players_left`. Affiche alors un message d'info du type "Tous les joueurs sont déjà en vue".
- La méthode va lancer un dé à 6 faces et va réagir en fonction de ce résultat aléatoire :
- Si le dé vaut 1, aucun nouveau joueur adverse n'arrive (afficher un message informant l'utilisateur).
- Si le dé vaut entre 2 et 4 inclus, un nouvel adversaire arrive en vue. Il faut alors créer un `Player` avec un nom aléatoire du genre "joueur_1234" ou "joueur_6938" (ou ce que tu veux) et injecter ce `Player` dans le array `@enemies_in_sight` . Affiche un message informant l'utilisateur de ce qui se passe.
- Si le dé vaut 5 ou 6, cette fois c'est 2 nouveaux adversaires qui arrivent en vue. De même qu'au-dessus, il faut les créer et les rajouter au jeu. Rajoute toujours un message informant l'utilisateur.

- Et maintenant, il faut que cette méthode `new_players_in_sight` soit appelée dans ton `app_3.rb` juste avant l'affichage du menu à l'utilisateur. Cela permet d'ajouter, petit à petit, des adversaires en vue !

Voilà, une fois que tu auras fait ça, tu pourras essayer de sortir vivant d'un combat contre 10, 20 voire 100 adversaires ! N'hésite pas à pimper l'affichage pour l'utilisateur et à joueur sur les paramètres (la vie de chaque adversaire, ta vie, la taille des packs de vie qu'on peut trouver, etc.) pour trouver les réglages qui sont les plus fun !
=end