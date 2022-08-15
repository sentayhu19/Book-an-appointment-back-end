class Api::SessionsController < Devise::SessionsController
  def create
    user = User.find_by(name: params[:user][:name])
    if user.present?
      token = user.generate_jwt
      render json: { user:, token: }, status: :ok
    else
      render json: { errors: 'User does not exist' }, status: :unprocessable_entity
    end
  end
end
