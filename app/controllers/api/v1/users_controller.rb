class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # GET /api/v1/users
  def show 
    render json: @user
  end

  # PATCH/PUT /api/v1/users
  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

    # DELETE /users/1
  def destroy 
    @user.destroy 
    head 204
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
