class DoorsController < ApplicationController
  def index
    @doors = Door.all
  end

  def show
    @door = Door.find(params[:id])
  end

  def new
    @door = Door.new
  end

  def create
    @door = Door.new(door_params)

    if @door.save
      redirect_to @door.house
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @door = Door.find(params[:id])
  end

  def update
    @door = Door.find(params[:id])

    if @door.update(door_params)
      redirect_to @door.house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def door_params
    params.require(:door).permit(:house_id)
  end
end
