class Api::ReservationsController < ApplicationController
  before_action :set_user, only: %i[index create]

  def index
    @reservations = @user.reservations
    render json: @reservations, status: :ok
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
    if @reservation.present?
      render json: @reservation, status: :ok
    else
      render json: { error: 'Reservation does not exist' }, status: :not_found
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    if reservation.present?
      reservation.update(reservation_params)
      render json: { success: 'Reservation successfully updated' }
    else
      render json: { error: 'Reservation does not exist' }, status: :not_found
    end
  end

  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.present?
      reservation.destroy
      render json: { success: 'Reservation successfully deleted' }
    else
      render json: { error: 'Reservation does not exist' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def reservation_params
    params.require('reservations').permit(:city, :date)
  end
end
