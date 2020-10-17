
class Player
  attr_accessor :name, :life_points

  # On créer des nouveaux joueurs ici, et on leur attribue un nom et des points de vie !
  def initialize(name)
    @name = name
    @max_life_points = 50
    @life_points = @max_life_points
    @weapon_level = 1
    @shield = 0
  end

  # Montre l'état d'un joueur
  def show_state
    puts "#{name} a #{@life_points} points de vie."
  end

  # Calcul des dégats 
  def compute_damage
    return rand(1..20) * @weapon_level
  end 

  # Calcul des soins
  def compute_heal
    return rand(1..100)
  end

  # Application des dégats sur les points de vie d'un personnage. Si PV <= 0, joueur décédé et PV PAS REMIS A 0
  def gets_damage(compute_damage)
    @life_points -= compute_damage
    if @life_points <= 0
      puts "HE IS DEAD"
    end
  end

  # Application des dégats sur les points de vie d'un personnage. Si PV <= 0, joueur décédé et PV PAS REMIS A 0
  def gets_heal(compute_heal)
    @life_points += compute_heal
    if @life_points > @max_life_points
      @life_points = @max_life_points
    end
  end

  # Enlève des pvs à la cible (Attaquer)
  def attacks(target)
    puts
    puts "Le joueur #{name} attaque le joueur #{target.name}"
    damage = compute_damage - target.shield
    if damage < 0 
      damage = 0
    end
    puts "Il lui inflige #{damage} points de dégat(s)."
    target.gets_damage(damage)
    # if damage > @max_life_points/2
    # puts "OULALALAAAA ! Il lui inflige #{damage} points de dommages !"
    # target.gets_damage(damage)
    # elsif damage > @max_life_points/4
    #   puts "Très joli coup ! Il lui inflige #{damage} points de dommages !"
    #   target.gets_damage(damage)
    # elsif damage > @max_life_points/8
    #   puts "Mouais... Il lui inflige #{damage} points de dommages."
    #   target.gets_damage(damage)
    # else 
    #   puts "Le coup est trèèès léger. Il lui inflige #{damage} points de dommages."
    #   target.gets_damage(damage)
    # end
  end
    # Rajoute des pvs à la cible (Soigner)
    def heal(target)
      puts
      puts "Le joueur #{name} soigne le joueur #{target.name}"
      heal = compute_heal
      if heal > @max_life_points/2
      puts "Très gros soin ! Il lui soigne #{heal} points de dommages !"
      target.gets_heal(heal)
      elsif damage > @max_life_points/4
        puts "Bon soin ! Il lui soigne #{heal} points de dommages !"
        target.gets_heal(heal)
      elsif damage > @max_life_points/8
        puts "Soin correct. Il lui soigne #{heal} points de dommages !"
        target.gets_heal(heal)
      else 
        puts "Soin léger. Il lui soigne #{heal} points de dommages !"
        target.gets_heal(heal)
      end
    end


  # On cherche un bouclier et on l'équipe si il est mieux que l'actuel
  def search_shield
    new_shield = rand(1..20)
    puts "Tu as trouvé une armure de niveau #{new_shield}"
    if new_shield > @shield
      puts "Youhou ! Elle est meilleure que ton armure actuelle... PRENDS LA !" 
      @shield = new_shield
    else
      puts "M@*#$... elle n'est pas mieux que ton armure actuelle..."
    end
  end

  # On cherche une arme et on l'équipe si elle est mieux que l'actuelle
  def search_weapon
    new_weapon_lvl = rand(1..10)
    puts "Tu as trouvé une arme de niveau #{new_weapon_lvl} !"
    if new_weapon_lvl > @weapon_level
      puts "Youhou ! Elle est meilleure que ton arme actuelle... PRENDS LA !" 
      @weapon_level = new_weapon_lvl
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  # On cherche à regagner de la vie... Attention aux maladresses !
  def search_health_pack
    try_find_health = rand(1..20) 
    case try_find_health
    when 1..5
      @life_points -= (@max_life_points/10)
      puts "Tu n'as rien trouvé... et tu te mange sur le sol..."
    when 6..10
      puts "Tu n'as rien trouvé... du tout !"
    when 11..15
      @life_points += (@max_life_points/5)
      puts "Bravo, tu as trouvé un joli pack de soin ! (+20% max_life_points)"
      if @life_points > @max_life_points
        @life_points = @max_life_points
      end
    else
      @life_points += (@max_life_points/2)
      puts "Waooooow ! Tu regagnes la moitié de ton énergie !"
      if @life_points > @max_life_points
        @life_points = @max_life_points
      end 
    end
  end
end