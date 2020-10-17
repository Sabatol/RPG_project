class Router 
  def initialize
    @game = Game.new
  end

  def perform
    puts
    puts " Bienvenue dans notre super RPG !"
    puts
    while true
      @game.menu_game
      action = @game.menu_game_action
      case action
      when 1
        @game.turn
      when 2
        puts "Ceci est un test"
      when 3
        puts "Ceci est un test avec un aide mémo ! @game.xxxxxx"
      when 4
        puts "Ciao bb! Oublie pas comme les breaks sont important pour casser des whiles sans condiditon d'arrêt !"
        break
      else 
        puts
        puts "CE CHOIX N'EXISTE PAS"
        puts
      end
    end
  end

end
