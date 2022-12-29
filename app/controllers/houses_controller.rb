class HousesController < ApplicationController
  def index
    @houses = House.all
  end

  def show
    @house = House.find(params[:id])
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      redirect_to @house
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
    @house = House.find(params[:id])

    if @house.update(house_params)
      redirect_to @house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.find(params[:id])
    @house.destroy

    redirect_to houses_path, status: :see_other
  end

  private

  def house_params
    params.require(:house).permit(:name, :exterior_color, :trim_color)
  end
end
