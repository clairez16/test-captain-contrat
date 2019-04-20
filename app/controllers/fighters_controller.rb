class FightersController < ApplicationController
  before_action :set_fighter, only: [:edit, :update, :destroy]

  def index
    @fighters = Fighter.all
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @fighter.assign_attributes(fighter_params)
    if @fighter.save
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :life_points, :attack_points, :photo, :category)
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
