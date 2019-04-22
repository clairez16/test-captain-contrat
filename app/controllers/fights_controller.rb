class FightsController < ApplicationController
  def new
    @fighters = Fighter.all.map(&:decorate_for_form)
    @equipements = Equipement.all.map(&:decorate_for_form)
    @fight = Fight.new
    2.times do
      @fight.fight_fighters.build
    end
  end

  def create
    @fight = Fight.new(fight_params)

    @fighters = Fighter.all.map(&:decorate_for_form)
    @equipements = Equipement.all.map(&:decorate_for_form)

    if @fight.save
      redirect_to fight_path(@fight)
    else
      render 'new'
    end
  end

  def show
    @fight = Fight.find(params[:id])
    @strikes = Stroke.where(fight: @fight).order(created_at: :asc)
  end

  private

  def fight_params
    params.require(:fight).permit(:name, fight_fighters_attributes: [:fighter_id, :equipement_id])
  end
end
