class Api::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save!
      @token = @user.generate_jwt
      render json: { user: @user, token: @token }, status: :ok
    else
      render json: { errors: 'User could not be created' }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.require('user').permit(:name)
  end
end
