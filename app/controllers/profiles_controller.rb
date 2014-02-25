class ProfilesController < ApplicationController
  def new
    Profile.create(profile_params)
  end


  private

  def profile_params
    params.require(:user).permit(:id)
  end

end
