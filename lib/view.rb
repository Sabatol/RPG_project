class View
  def menu_game
    puts "Tu veux faire quoi jeune mouss' ?"
    puts
    puts "1. Je veux jouer un tour !"
    puts "2. Je veux en savoir plus sur le jeu !"
    puts "3. Je sais pas quoi proposer enfait..."
    puts "4. Je veux arrêter de jouer."
    puts
    print "Ton action > "
    return gets.chomp.to_i
    puts
  end
  #Affiche le menu pour un joueur humain
  def menu
    puts "Alors, tu veux faire quoi maintenant ?"
    puts
    puts "a - chercher une meilleure arme"
    puts    
    puts "b - chercher une meilleure armure"
    puts
    puts "s - chercher à se soigner" 
    puts
    puts "Ou attaquer un joueur en vue :"
    puts

  end

  def menu_choice
    action_possibilities = ["a","b","s","0","1","2","3","4"]
    print "Ton action > "
    action = gets.chomp
    until action_possibilities.include?(action)
      print "Action non reconnue, recommence ! > "
      action = gets.chomp
    end
    return action_agreed = action
  end

end