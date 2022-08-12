class Api::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    user = User.new(sign_up_params)
    if user.save!
      render json: user, status: :ok
      redirect_to root_path
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def sign_up_params
    params.permit(:name)
  end
end
