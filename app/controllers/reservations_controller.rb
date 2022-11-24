class ReservationsController < ApplicationController
  before_action :set_rocket, only: %i[new create show]

  def new
    @reservation = Reservation.new
    @user = current_user
    authorize @rocket
  end

  def create
    @reservation = Reservation.new(reservation_params)
    date = params[:reservation][:start_date].split
    @reservation.end_date = date[2]
    @reservation.user = current_user
    authorize @rocket
    @reservation.rocket = @rocket
    if @reservation.save
      redirect_to profile_path, status: :see_other
      # redirect_to rocket_reservation_path(@rocket, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to profile_path, status: :see_other
  end

  def show
    authorize @rocket
  end

  def accept
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.update!(status: true)
    redirect_to profile_path, status: :see_other
  end

  private

  def set_rocket
    @rocket = Rocket.find(params[:rocket_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :travelers, :status)
  end
end
