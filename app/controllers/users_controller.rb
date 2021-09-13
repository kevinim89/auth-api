class UsersController < ApplicationController

  def show
    users = User.find(params[:id])
    render json: users
  end

  def create
    user = User.new(
      user_id: current_user.id,
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end
end