class Api::V1::UsersController < ApplicationController
  # GET /api/v1/users
  def show 
    render json: User.find(params[:id])
  end
end
