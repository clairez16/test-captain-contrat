#créer un fichier lib qui s'occupe de toute la partie calcul du combat?

class FightsController < ApplicationController
  def create
    fighter_1 = Fighter.find(index_1)
    fighter_2 = Fighter.find(index_1)

    Fight.new(winner: , loser: )
  end
end


#sans armes ni catégories!

#décider qui commence
current_player = rand(1)
#

total_stroke_points_1 = 0
total_stroke_points_2 = 0

puts "Fighter 1: life: #{fighter_1.life_points} attack: #{fighter_1.attack_points}"
puts "Fighter 2: life: #{fighter_2.life_points} attack: #{fighter_2.attack_points}"


until fighter_1.life_points - total_stroke_points_1 <= 0 || fighter_2.life_points - total_stroke_points_2 <= 0

  #fighter_2
  if current_player % 2 == 0
    if rand(RNG - 1) == 1
      hit_points = 0
    else
      hit_points = fighter_2.attack_points
    end

    puts "Fighter 1: -#{hit_points}"
    total_stroke_points_1 += hit_points
  else
    if rand(RNG - 1) == 1
      hit_points = 0
    else
      hit_points = fighter_1.attack_points
    end

    puts "Fighter 2: -#{hit_points}"
    total_stroke_points_2 += hit_points
  end

  current_player += 1
end

#ajouter point d'expérience
#save > if expérience = 10 > passer au niveau suivant

puts "Fighter 1: #{total_stroke_points_1}"
puts "Fighter 2: #{total_stroke_points_2}"
