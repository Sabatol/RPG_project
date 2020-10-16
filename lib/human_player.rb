class HumanPlayer < Player
  attr_accessor :life_points, :weapon_level, :shield, :max_life_points

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
  
  def menu
    puts "Alors, tu veux faire quoi maintenant ?"
    puts
    puts "a - chercher une meilleure arme"
    puts
    puts "s - chercher à se soigner" 
    puts
    puts "Ou attaquer un joueur en vue :"
    puts
  end
  def menu_choice
    print "Ton action > "
    return gets.chomp
  end
end