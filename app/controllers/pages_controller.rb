class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @rockets = current_user.rockets
    @reservations = current_user.reservations
  end
end
