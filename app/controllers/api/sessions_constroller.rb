class Api::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(name: params[:user][:name])
    if user.present?
      render json: user, status: :ok
      redirect_to root_path
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
