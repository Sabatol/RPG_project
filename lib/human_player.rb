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

  # Montre l'état du joueur 
  def show_state
    puts "#{name} a #{life_points} points de vie et tient une arme de niveau #{weapon_level} et une armure de niveau #{shield}"
  end 
  
  
  # Mets en application la décision du joueur (pas encore codé : ne fais pas perdre un tour au joueur quand il se trompe (while pour piéger dans le gets.chomp))
  def decision(action)
    
  end
end