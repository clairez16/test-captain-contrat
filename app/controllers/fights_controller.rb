class FightsController < ApplicationController
  RNG = 10

  def new
    @fight = Fight.new
    @fighters = Fighter.all
    @equipements = Equipement.all
  end

  def create
    fight = Fight.new(fight_params)
    fight.winner = calculate_outcome_of_fight(fight)
    if fight.save
      redirect_to fight_path(fight)
    end
  end

  def show
    @fight = Fight.find(params[:id])
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_1_id, :fighter_2_id, :equipement_1_id, :equipement_2_id)
  end

  def calculate_outcome_of_fight(fight)
    current_player = rand(2)

    total_stroke_points_1 = 0
    total_stroke_points_2 = 0

    until fight.fighter_1.life_points - total_stroke_points_1 <= 0 || fight.fighter_2.life_points - total_stroke_points_2 <= 0
      if current_player % 2 == 0
        if rand(RNG) == 1
          hit_points = 0
        else
          hit_points = fight.fighter_2.attack_points
        end

        total_stroke_points_1 += hit_points
      else
        if rand(RNG) == 1
          hit_points = 0
        else
          hit_points = fight.fighter_1.attack_points
        end

        total_stroke_points_2 += hit_points
      end

      current_player += 1
    end

    fight.fighter_1.life_points - total_stroke_points_1 <= 0 ? fight.fighter_2 : fight.fighter_1
  end
end
