class RocketsController < ApplicationController
  before_action :set_rocket, only: [:show, :edit, :update, :destroy]

  def index
    @rockets = Rocket.all
  end

  def new
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @rocket.user = current_user
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rocket.update(rocket_params)
      redirect_to rocket_path(@rocket)
    else
      render :edit
    end
  end

  def destroy
    @rocket.destroy
    redirect_to rockets_path, status: :see_other
  end

  private

  def set_rocket
    @rocket = Rocket.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def rocket_params
    params.require(:rocket).permit(:name, :description, :price, :capacity, :address)
  end
end
