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
    authorize @plant
    @plant.save
    redirect_to plants_path
  end

  def edit
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    authorize @plant
    redirect_to plants_path
  end

  def my_plants
    @plant = Plant.new
    # pegar a venda que tem a ver com o usuario
    @sales = current_user.sales
    # ter as plantas que o usuario vende
    @plants = current_user.plants
    authorize @plant
  end

  private

  def plant_params
    params.require(:plant).permit(:specie, :price, :description, :quantity, :is_avaiable,:photo)
  end
end
