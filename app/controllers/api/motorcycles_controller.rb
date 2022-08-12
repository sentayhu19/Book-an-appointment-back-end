class Api::MotorcyclesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @motors = Motorcycle.all
    render json: @motors
  end

  def new
    @motor = Motorcycle.new
  end

  def create
    motor = Motorcycle.new(motor_params.merge(user: @user))
    if @motor.save
      render json: motor, status: :ok
    else
      render json: { errors: motor.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
    @motor = Motorcycle.find(params[:id])
  end

  def show
    @motor = Motorcycle.find(params[:id])
    render json: @motor
  end

  def update
    motor = Motorcycle.find(params[:id])
    motor.update(motor_params)
  end

  def destroy; end
  motor = Motorcycle.find(params[:id])
  motor.destroy

  private

  def set_user
    @user = current_user
  end

  def motor_params
    params.require('motors').permit(:model, :deposit, :total_payable, :finance_fee, :purchase_fee, :duration_months,
                                    :apr_rep)
  end
end
