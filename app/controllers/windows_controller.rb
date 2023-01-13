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

  def edit
    @window = Window.find(params[:id])
  end

  def update
    @window = Window.find(params[:id])

    if @window.update(window_params)
      redirect_to @window.house
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @window = Window.find(params[:id])
    @window.destroy

    redirect_to windows_path, status: :see_other
  end

  private

  def window_params
    params.require(:window).permit(:house_id)
  end
end
