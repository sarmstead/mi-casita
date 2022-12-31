class HomeOwnershipsController < ApplicationController
  def index
    @ownerships = HomeOwnership.all
  end

  def show
    @ownership = HomeOwnership.find(params[:id])
  end

  def new
    @ownership = HomeOwnership.new
  end

  def create
    @ownership = HomeOwnership.new(ownership_params)

    if @ownership.save
      redirect_to @ownership
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ownership = HomeOwnership.find(params[:id])
  end

  def update
    @ownership = HomeOwnership.find(params[:id])

    if @ownership.update(ownership_params)
      redirect_to @ownership
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ownership = HomeOwnership.find(params[:id])
    @ownership.destroy

    redirect_to home_ownerships_path, status: :see_other
  end

  private

  def ownership_params
    params.require(:home_ownership).permit(:person_id, :house_id)
  end
end
