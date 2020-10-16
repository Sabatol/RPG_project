class Game
  def initialize
    @user_player = HumanPlayer.new("Fifou")
    enemies_name = ["Florian", "Laurox dorée", "Kurkox argenté", "Cyprien", "Romain", "Nico", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
    @enemies = enemies_name.sample(4).map!{|enemi_name| Player.new(enemi_name)}
  end

  def turn
    @user_player.menu
    @user_player.menu_choice
    @enemies.each {|enemi| enemi.show_state}
    @enemies.each {|enemi| enemi.attacks(@user_player)}
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

  def menu
    puts "Tu veux faire quoi jeune mouss' ?"
    puts "1. Je veux jouer un tour !"
    puts "2. Je veux en savoir plus sur le jeu !"
    puts "3. Je sais pas quoi proposer enfait..."
    puts "4. Je veux arrêter de jouer."
  end
end