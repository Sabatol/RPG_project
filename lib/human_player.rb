require_relative 'game'

class HumanPlayer < BasePlayer
  attr_accessor :life_points, :weapon_level, :shield, :max_life_points, :enemies

  def initialize(name)
    @name = name
    @max_life_points = 200
    @life_points = @max_life_points
    @weapon_level = 2
    @shield = 2
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et tient une arme de niveau #{weapon_level} et une armure de niveau #{shield}"
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

  # Retourne une décision du joueur humain
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

  # 
  def decision(action)
    case action
    when "a"
      search_weapon
    when "b"
      search_shield
    when "s"
      search_health_pack
    else
      numbers = ["0","1","2","3","4"]
      if numbers.include?(action)
        attacks($enemies[action.to_i])
        try_to_kill($enemies[action.to_i])
      else
      puts "Tant pis pour toi, fais attention à ce que tu écris parce que là, tu perds un tour à te faire marrave gratos !"
      end
    end
  end
end