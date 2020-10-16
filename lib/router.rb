class Router 
  def initialize
    @game = Game.new
  end

  def perform
    puts " Bienvenue dans notre super RPG !"
    while true
      puts "Tu veux faire quoi jeune mouss' ?"
      puts "1. Je veux jouer un tour !"
      puts "2. Je veux en savoir plus sur le jeu !"
      puts "3. Je sais pas quoi proposer enfait..."
      puts "4. Je veux arrêter de jouer."
      choice = gets.chomp.to_i
      case choice
      when 1
        @game.show_all_enemies_alive
        @game.turn
      when 2
        "Ceci est un test"
      when 3
        "Ceci est un test avec un aide mémo ! @game.xxxxxx"
      when 4
        puts "Ciao bb! Oublie pas comme les breaks sont important pour casser des whiles sans condiditon d'arrêt !"
        break
      else 
        "CE CHOIX N'EXISTE PAS"
      end
    end
  end

end
