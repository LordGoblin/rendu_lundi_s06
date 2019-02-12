class UsersController < ApplicationController
  before_action :user_id, only: [:show]
  before_action :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def user_id
    if current_user[:id] != (params[:id]).to_i
      	redirect_to "/events"
    end
  end
end