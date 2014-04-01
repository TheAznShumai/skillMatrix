class ProfilesController < ApplicationController
  authorize_resource
  def edit
    @profile = Profile.where(:id => params[:id]).first
  end

  def show
    @profile = Profile.where(:id => params[:id]).first
    @user = User.joins(:profile).where(:profiles => {:id => params[:id]}).includes(:attempts => :survey).first
    respond_to do |format|
      format.html
      format.json {render :json => @profile}
    end
  end

  def update
    @profile = Profile.where(:id => params[:id]).first
    if @profile.update_attributes!(profile_params)
      respond_to do |format|
        format.html { redirect_to( @profile)}
        format.json { render :json => @profile}
      end
    else
      respond_to do |format|
        format.html { render :action  => :edit } # edit.html.erb
        format.json { render :nothing =>  true }
      end
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :title, :office_phone, :cell_phone,
                                    :department, :avatar)
  end

end
