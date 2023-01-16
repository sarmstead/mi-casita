class Workshop::HousesController < ApplicationController
  before_action :authenticate_person!

  def index
    @houses = current_person.houses
  end

  def show
    if persons_house?
      @house = House.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      HomeOwnership.create(house: @house, person: current_person)
      redirect_to houses_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    if persons_house?
      @house = House.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def update
    @house = House.find(params[:id])

    if persons_house && @house.update(house_params)
      redirect_to @house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @house = House.find(params[:id])

    if persons_house?
      @house.destroy
      redirect_to houses_path, status: :see_other
    end
  end

  private

  def house_params
    params.require(:house).permit(:name, :exterior_color, :trim_color)
  end

  def persons_house?
    current_person.house_ids.include?(params[:id]) ? true : false
  end
end
