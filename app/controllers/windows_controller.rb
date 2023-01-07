class WindowsController < ApplicationController
  def index
    @windows = Window.all
  end

  def show
    @window = Window.find(params[:id])
  end

  def new
    @window = Window.new
  end

  def create
    @window = Window.new(window_params)

    if @window.save
      redirect_to @window.house
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def window_params
    params.require(:window).permit(:house_id)
  end
end
