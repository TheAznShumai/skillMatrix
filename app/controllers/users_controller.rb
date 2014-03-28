class UsersController < ApplicationController
  authorize_resource
  def index
    @users = User.where(true)
  end

  def show
    @user = User.where(:id => params[:id]).includes(:skills, :ratings)
  end

  def destroy
    @user = User.where(:id => params[:id]).first
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  def new_user_params
      params.require.(:user).permit(:login)
  end
end
