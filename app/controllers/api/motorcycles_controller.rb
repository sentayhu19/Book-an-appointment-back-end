class Api::MotorcyclesController < ApplicationController
  before_action :set_user, only: [:create]

  def index
    @motors = Motorcycle.all
    if @motors
      render json: @motors
    else
      render json: { error: 'Oops! Could not get motors!' }, status: :not_found
    end
  end

  def new
    @motor = Motorcycle.new
  end

  def create
    motor = Motorcycle.new(motor_params.merge(user: @user))
    if motor.save
      render json: motor, status: :ok
    else
      render json: { errors: 'Motorcycle could not be created' }, status: :unprocessable_entity
    end
  end

  def edit
    @motor = Motorcycle.find(params[:id])
  end

  def show
    @motor = Motorcycle.find(params[:id])
    if @motor.present?
      render json: @motor, status: :ok
    else
      render json: { error: 'Motor does not exist' }, status: :not_found
    end
  end

  def update
    motor = Motorcycle.find(params[:id])
    if motor.present?
      motor.update(motor_params)
      render json: { success: 'Motor successfully updated' }
    else
      render json: { error: 'Motor does not exist' }, status: :not_found
    end
  end

  def destroy
    motor = Motorcycle.find(params[:id])
    if motor.present?
      motor.destroy
      render json: { success: 'Motor successfully deleted' }
    else
      render json: { error: 'Motor does not exist' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def motor_params
    params.require('motors').permit(:model, :deposit, :total_payable, :finance_fee, :purchase_fee, :duration_months,
                                    :apr_rep)
  end
end
