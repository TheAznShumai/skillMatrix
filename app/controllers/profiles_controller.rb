class ProfilesController < ApplicationController
  authorize_resource

  def show
    @profile = Profile.where(:id => params[:id]).first
    @user = User.joins(:profile).where(:profiles => {:id => params[:id]})\
      .includes(:attempts => :survey).first
    respond_to do |format|
      format.html
      format.json {render :json => @profile}
    end
  end
end
