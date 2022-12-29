class HomeOwnershipsController < ApplicationController
  def index
    @ownerships = HomeOwnership.all
  end

  def show
    @ownership = HomeOwnership.find(params[:id])
  end
end
