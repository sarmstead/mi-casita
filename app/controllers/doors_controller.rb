class DoorsController < ApplicationController
  def index
    @doors = Door.all
  end

  def show
    @door = Door.find(params[:id])
  end
end
