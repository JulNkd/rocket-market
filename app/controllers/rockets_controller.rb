class RocketsController < ApplicationController
  before_action :set_rocket, only: %i[show edit update destroy]

  def index
    @user = current_user
    if params[:query].present?
      @rockets = Rocket.search_by_name_and_address(params[:query])
    else
      @rockets = Rocket.all
    end
  end

  def new
    @rocket = Rocket.new
    authorize @rocket
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @rocket.user = current_user
    authorize @rocket
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    authorize @rocket
  end

  def edit
    authorize @rocket
  end

  def update
    authorize @rocket
    if @rocket.update(rocket_params)
      redirect_to rocket_path(@rocket)
    else
      render :edit
    end
  end

  def destroy
    authorize @rocket
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
    params.require(:rocket).permit(:name, :description, :price, :capacity, :address, :photo)
  end
end
