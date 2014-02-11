class UsersController < ApplicationController
  def index
      @users = User.where(true) 
  end

  def show
      @user = User.where(user_id: new_user_params)
  end

  def new_user_params
      params.require.(:user).permit(:id)
  end
end
