class Workshop::HomeOwnershipsController < ApplicationController
  def index
    @home_ownerships = HomeOwnership.all
  end

  def show
    @home_ownership = HomeOwnership.find(params[:id])
  end

  def new
    @home_ownership = HomeOwnership.new
  end

  def create
    @home_ownership = HomeOwnership.new(home_ownership_params)

    if @home_ownership.save
      redirect_to @home_ownership
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @home_ownership = HomeOwnership.find(params[:id])
  end

  def update
    @home_ownership = HomeOwnership.find(params[:id])

    if @home_ownership.update(home_ownership_params)
      redirect_to @home_ownership
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @home_ownership = HomeOwnership.find(params[:id])
    @home_ownership.destroy

    redirect_to home_ownerships_path, status: :see_other
  end

  private

  def home_ownership_params
    params.require(:home_ownership).permit(:person_id, :house_id)
  end
end
