class Api::ReservationsController < ApplicationController
  before_action :set_user, only: %i[index create]

  def index
    @reservations = @user.reservations
    render json: @reservations
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @motor = Motorcycle.find(params[:motor_id])
    reservation = Reservation.new(reservation_params.merge(user: @user, motorcycle: @motor))
    if reservation.save
      render json: reservation, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def show
    @reservation = Reservation.find(params[:id])
    render json: @reservation
  end

  def update
    reservation = Reservation.find(params[:id])
    reservation.update(reservation_params)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require('reservations').permit(:city, :date)
  end
end
