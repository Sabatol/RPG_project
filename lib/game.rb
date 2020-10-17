class Game
  def initialize
    @user_player = HumanPlayer.new("Fifou")
    enemies_name = ["Florian", "Laurox dorée", "Kurkox argenté", "Cyprien", "Romain", "Nico", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
    @enemies = enemies_name.sample(4).map!{|enemi_name| Player.new(enemi_name)}
  end
  #Affichage du menu de jeu
  def menu_game
    puts "Tu veux faire quoi jeune mouss' ?"
    puts
    puts "1. Je veux jouer un tour !"
    puts "2. Je veux en savoir plus sur le jeu !"
    puts "3. Je sais pas quoi proposer enfait..."
    puts "4. Je veux arrêter de jouer."
  end
  def menu_game_action
    puts
    print "Ton action > "
    return gets.chomp.to_i
    puts
  end
  #Déroulement d'un tour
  def turn
    # Affichage du menu pour le joueur
    @user_player.menu
    @enemies.each do |enemi|
      if enemi.life_points != 0
        print "#{@enemies.index(enemi)} - " 
        puts enemi.show_state
      end
    end
    # Prise de décision du joueur
    choice = @user_player.menu_choice
    @user_player.decision(choice)
    #tour des ennemis
    @enemies.each {|enemi| enemi.show_state}
    @enemies.each {|enemi| enemi.attacks(@user_player)}
    #fin du tour
    @user_player.show_state
  end

  def show_all_enemies_alive
    @enemies.each do |enemi|
      if enemi.life_points != 0
        print "#{@enemies.index(enemi)} - " 
        puts enemi.show_state
      end
    end
  end
end