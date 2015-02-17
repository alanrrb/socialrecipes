class CuisinesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_cuisine, only: [:show, :edit, :update, :destroy]
  def new
    @cuisine = Cuisine.new
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    if @cuisine.save
      redirect_to @cuisine, notice: 'Cuisine was successfully created.'
    else
      render :new
    end
  end

  def update
    if @cuisine.update(cuisine_params)
      redirect_to @cuisine, notice: 'Cuisine was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @cuisine.destroy
    redirect_to cuisine_url, notice: 'Cuisine was successfully destroyed.'
  end

  def edit
  end

  def index
    @cuisines = Cuisine.all
  end

  def show
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
  end

  def cuisine_params
    params.require(:cuisine).permit(:name)
  end
end
