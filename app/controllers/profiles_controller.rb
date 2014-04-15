class ProfilesController < ApplicationController
  load_and_authorize_resource

  def show
    @user = User.joins(:profile).where(:profiles => {:id => params[:id]})\
      .includes(:attempts => :survey).first
    respond_to do |format|
      format.html
      format.json {render :json => @profile}
    end
  end
end
