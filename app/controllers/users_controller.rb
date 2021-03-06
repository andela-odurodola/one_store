class UsersController < ApplicationController
  skip_before_action :authorize_request, only: :create
  def create
    user = User.create!(user_params)
    user_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: user_token }
    json_response(response, :created)
  end

  private

  def user_params
    params.permit(:name, :address, :email, :password, :admin)
  end
end
