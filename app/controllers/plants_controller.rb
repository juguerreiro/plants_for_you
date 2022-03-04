class PlantsController < ApplicationController

  def index
    @plants = policy_scope(Plant).order(created_at: :desc)
  end

  def show
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    @plant.save
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:specie, :price, :description, :quantity, :is_avaiable,:photo)
  end
end
