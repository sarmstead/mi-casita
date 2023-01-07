class WindowsController < ApplicationController
  def index
    @windows = Window.all
  end

  def show
    @window = Window.find(params[:id])
  end
end
