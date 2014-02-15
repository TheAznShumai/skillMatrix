class UsersController < ApplicationController
  def index
      @users = User.where(true) 
  end

  def show
      @user = (User.where(id: params[:id]).includes(:skills, :ratings)).first
  end

  def new_user_params
      params.require.(:user).permit(:id)
  end
end
