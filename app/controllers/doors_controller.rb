class DoorsController < ApplicationController
  def index
    @doors = Door.all
  end
end
