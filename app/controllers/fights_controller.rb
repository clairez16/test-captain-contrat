class FightsController < ApplicationController
  def new
    @fight = Fight.new
    @fighters = Fighter.all.map(&:decorate_for_form)
    @equipements = Equipement.all.map(&:decorate_for_form)
  end

  def create
    binding.pry
    fight = Fight.create(fight_params)
    redirect_to fight_path(fight)
  end

  def show
    @fight = Fight.find(params[:id])
    @strikes = Stroke.where(fight: @fight).order(created_at: :asc)
  end

  private

  def fight_params
    params.require(:fight).permit(:fighter_1_id, :fighter_2_id, :equipement_1_id, :equipement_2_id)
  end
end
