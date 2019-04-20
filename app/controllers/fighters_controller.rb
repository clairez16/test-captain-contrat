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
      redirect_to root_path
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
    binding.pry
    @fighter.destroy
    redirect_to root_path
  end

  private

  def fighter_params
    params.require(:fighter).permit(:name, :life_points, :attack_points, :photo)
  end

  def set_fighter
    @fighter = Fighter.find(params[:id])
  end
end
