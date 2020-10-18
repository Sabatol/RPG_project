class Game
  attr_accessor :enemies
  def initialize
    @view = View.new
    @user_player = HumanPlayer.new("Fifou")
    enemies_name = ["Florian", "Laurox dorée", "Kurkox argenté", "Cyprien", "Romain", "Nico", "Chris", "Philibert", "David", "Jean-Marc", "Killian", "John", "Jean-Morray", "Francine", "Yvette", "Honoré"]
    @enemies = enemies_name.sample(4).map!{|enemi_name| BasePlayer.new(enemi_name)}
  end
  #Affichage du menu de jeu
  def menu_game
    @view.menu_game
  end


  #Déroulement d'un tour
  def turn
    # Affichage du menu pour le joueur
    @view.menu
    @enemies.each do |enemi|
      if enemi.life_points != 0
        print "#{@enemies.index(enemi)} - " 
        puts enemi.show_state
      end
    end
    # Prise de décision du joueur (A mettre dans le view!)
    action = @view.menu_choice
    case action
    when "a"
      @user_player.search_weapon
    when "b"
      @user_player.search_shield
    when "s"
      @user_player.search_health_pack
    else
      numbers = ["0","1","2","3","4"]
      if numbers.include?(action)
        @user_player.attacks(@enemies[action.to_i])
        @user_player.try_to_kill(@enemies[action.to_i])
      else
      puts "Tant pis pour toi, fais attention à ce que tu écris parce que là, tu perds un tour à te faire marrave gratos !"
      end
    end
    #tour des ennemis
    @enemies.each {|enemi| enemi.show_state}
    @enemies.each {|enemi| enemi.attacks(@user_player)}
    #fin du tour
    @user_player.show_state
  end

  def is_finish?
    if @user_player.life_points > 0 && @enemies.length > 0
      return false
    else
      return true
    end
  end

  # Pour le moment inutile ?!
  def show_all_enemies_alive
    @enemies.each do |enemi|
      if enemi.life_points != 0
        print "#{@enemies.index(enemi)} - " 
        puts enemi.show_state
      end
    end
  end
end