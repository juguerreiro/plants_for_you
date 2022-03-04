class PlantsController < ApplicationController

  def index
   #@plants = policy_scope(Plant).order(created_at: :desc)
   @plants = Plant.all
  end

  def show
    @plant = Plant.find(params[:id])
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.save
  end

  private

  def plant_params
    params.require(:plant).permit(:specie, :price, :description, :quantity, :is_avaiable)
  end
end
