class ReservationsController < ApplicationController
  before_action :set_rocket, only: %i[new create show]

  def new
    @reservation = Reservation.new
    authorize @rocket
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    authorize @rocket
    @reservation.rocket = @rocket
    if @reservation.save
      redirect_to rocket_reservation_path(@rocket, @reservation)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def show
    authorize @rocket
  end

  private

  def set_rocket
    @rocket = Rocket.find(params[:rocket_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :travelers)
  end
end
