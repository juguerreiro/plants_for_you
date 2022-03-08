class SalesController < ApplicationController
  def create
    @plant = Plant.find(params[:plant_id])
    @user = current_user
    @sale = Sale.new
    @sale.plant = @plant
    @sale.user = @user
    if @sale.save
      @plant.quantity -= 1
      @plant.save
      redirect_to plants_path
    else
      render "plants/show"
    end
    authorize @sale
  end
end

# pegar o plant_id
# pegar o user_id
# criar a venda
# diminuir a quantidade da planta
# redirecionar para a plants#my_plants
