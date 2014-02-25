class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id]) 
  end

  private

  def profile_params
    params.require(:user).permit(:id)
  end

end
