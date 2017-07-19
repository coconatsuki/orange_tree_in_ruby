class Oranger
  def initialize
    @name = ""
    @height = 0.1
    @age = 0
    @need_water = 5
    @need_compost = 5
    @disease = 0
    @dryness = 0
    @oranges_number = 0
    puts ""
    puts "Vous venez de planter un petit oranger !"
    puts "Pour l'instant, il mesure #{@height} mètres"
    puts "\nComment allez-vous l'appeler ?"
    @name = gets.chomp
    puts "\nFélicitation ! Votre oranger a maintenant un nom. Il s'appelle #{@name}"
    manuel
    commands
  end

  def commands
    puts "\nQue voulez-vous faire ?"
    answer = gets.chomp
    if answer == "taille"
      height
    elsif answer == "age"
      age
    elsif answer == "etat"
      condition
    elsif answer == "oranges"
      how_many_oranges
    elsif answer == "arroser"
      water
    elsif answer == "compost"
      compost
    elsif answer == "recolter"
      pick_fruits
    elsif answer == "temps"
      time
    elsif answer == "manuel"
      manuel
    elsif answer == "quitter"
      exit
    else
      puts "Pardon, j'ai mal compris. Que voulez-vous faire ? Pour revoir les options, tapez 'manuel'"
      commands
    end
  end


# user commands definitions
def manuel
  puts "\nVoici le manuel d'utilisation avec toutes les options que vous pouvez utiliser :\n
  pour connaitre :
  la taille de votre arbre,            tapez 'taille'
  l'âge de votre arbre,                tapez 'age'
  l'état de votre arbre,               tapez 'etat'
  Le nombre d'oranges sur votre arbre, tapez 'oranges'

  Pour :
  arroser,                             tapez 'arroser'
  donner du compost,                   tapez 'compost'
  récolter des fruits,                 tapez 'recolter'.
  faire passer une année,              tapez 'temps'
  revoir ce manuel,                    tapez 'manuel'
  quitter le programme                 tapez 'quitter'"
  commands
end

  def height
    puts "\n ====> '#{@name} mesure actuellement #{@height.round(2)} mètres.'"
    commands
  end

  def age
    puts "\n ====> '#{@name} a maintenant #{@age} ans.'"
    commands
  end

  def condition
    if(thirsty? || @dryness >= 5 || @disease >= 2 || @need_compost >= 5)
        if thirsty?
          puts "\n ====> '#{@name} aurait peut-être besoin d'être arrosée.'"
        end
        if @dryness >= 5
          puts "\n ====> '#{@name} a l'air un peu desseché. Arrosez-le plus souvent.'"
        end
        if @disease >= 2
          puts "\n ====> '#{@name} a l'air un peu malade. Vous l'arrosez peut-être trop ?'"
        end
        if @need_compost >= 5
          puts "\n ====> 'Votre arbre aurait besoin d'être nourri avec du compost.'"
        end
    else
      puts "\n ====> '#{@name} se porte comme un charme !'"
    end
    commands
  end

  def time
    passage_of_time
    commands
  end

  def water
    if @dryness >= 2
      @dryness -= 2
    end
    if @need_water <= 0
      puts "\n ====> 'attention, vous mettez trop d'eau ! Vous allez faire pourir #{@name}.'"
      @disease +=1
    elsif(@need_water >= 5  && @need_water <= 10)
          @need_water -= 5
       puts "\n ====> '#{@name} reprend des couleurs !'"
    end
    if @disease >= 5
      puts "\n ====> 'A force de trop arroser votre arbre, celui-ci a fini par tomber malade et pourir.'"
    exit
    end
    commands
  end

  def compost
    if @need_compost > 0
      @need_compost = 0
       if baby?
         puts "\n ====> '#{@name} est content ! Il va grandir davantage l'année suivante'"
       else
         puts "\n ====> 'Comme votre arbre est bien nourri, il produira davantage l'année suivante !'"
       end
    else
      puts "\n ====> 'Le compost, c'est bien... Mais inutile d'en abuser !'"
    end
    commands
  end

  def how_many_oranges
    puts "\n ====> 'Vous avez #{@oranges_number} oranges sur votre arbre.'"
    commands
  end

    def integer? number
      number.to_i.to_s == number.to_s
    end

  def pick_fruits
    puts "\n ====> 'combien de fruits souhaitez-vous récolter ? Tapez un nombre.'"
    num = gets.chomp
       if ((integer? num) && num.to_i > 0)
         num = num.to_i
         if @oranges_number == 0
            puts "\n ====> 'Il n'y a pas d'oranges sur votre arbre.'"
            puts " ====> 'Il va falloir attendre encore !'"
         elsif @oranges_number >= num
            @oranges_number -= num
            puts "\n ====> 'Vous récoltez #{num} fruits et vous vous régalez !'"
            puts "'Il reste #{@oranges_number} oranges sur votre arbre.'"
         elsif @oranges_number < num
            puts "\n ====> 'Vous ne pouvez pas en récolter autant, car il n'y a que #{@oranges_number} oranges sur votre arbre.'"
          end
      else
        puts "\n -----------------------------------------"
        puts "\n ====> 'Je n'ai pas compris. Avez-vous bien tapé un nombre supérieur à 0 ?'"
        pick_fruits
      end
     commands
  end

# private interface

#definitions
  def thirsty?
    @need_water >= 5
  end
  def not_hungry?
    @need_compost <= 5
  end
  def very_hungry?
    @need_compost == 10
  end
  def baby?
    @age < 3
  end
  def young?
    !baby? && @age <= 5
  end
  def adult?
    @age > 5 && @age <= 30
  end
  def old?
    @age > 30 && @age < 50
  end
  def dead?
    @age >= 50
  end

  def growth
    if !dead?
      if baby?
          if very_hungry?
            @height += 1
          else
            @height += 1.5
          end
       elsif (!baby? && @age <= 8)
         if very_hungry?
           @height += 0.2
         else
           @height += 0.5
         end
       end
     puts "\n-------------------- Nouvelle année --------------------"
     puts "\n ====> 'Votre arbre a maintenant #{@age} ans et mesure #{@height.round(2)} mètres.'"
    else
     puts "\n ====> 'Votre arbre s'est asseché et ne produit plus.'"
     puts " ====> 'Il n'est plus qu'un abri pour les insectes et les champignons.'"
     puts "'Mais vous avez pris bien soin de lui. Félicitation !'"
     exit
   end
 end

 def orange_production
   if young?
     if not_hungry?
       @oranges_number += 30
     else
       @oranges_number += 10
     end
   elsif adult?
     if not_hungry?
       @oranges_number += 70
     else
       @oranges_number += 50
     end
   elsif old?
     if not_hungry?
       @oranges_number += 30
     else
       @oranges_number += 20
     end
   end
 end

  def passage_of_time
    @age += 1
    @need_water = 10
    @oranges_number = 0
    @dryness += 2
    if @dryness >= 10
      puts " ====> 'Vous n'avez pas assez arrosé votre arbre et il s'est déseché.'"
      exit
    end
    if not_hungry?
      @need_compost += 5
    end
    orange_production
    growth
  end
end

oranger = Oranger.new
