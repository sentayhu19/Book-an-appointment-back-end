class Api::Reservations < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @reservations = @user.reservations.all
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

  def destroy; end
  reservation = Reservation.find(params[:id])
  reservation.destroy

  private

  def set_user
    @user = current_user
  end

  def reservation_params
    params.require('reservations').permit(:city, :date)
  end
end
