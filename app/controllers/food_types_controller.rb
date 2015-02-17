class FoodTypesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_food_type, only: [:show, :edit, :update, :destroy]
  def new
    @food_type = FoodType.new
  end

  def create
    @food_type = FoodType.new(food_type_params)
    if @food_type.save
      redirect_to @food_type, notice: 'Food Type was successfully created.'
    else
      render :new
    end
  end

  def update
    if @food_type.update(food_type_params)
      redirect_to @food_type, notice: 'Food Type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @food_type.destroy
    redirect_to food_type_url, notice: 'Food type was successfully destroyed.'
  end

  def edit
  end

  def index
    @food_types = FoodType.all
  end

  def show
  end

  private

  def set_food_type
    @food_type = FoodType.find(params[:id])
  end

  def food_type_params
    params.require(:food_type).permit(:name)
  end
end
