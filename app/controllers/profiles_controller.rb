class ProfilesController < ApplicationController
  def edit
    @profile = Profile.find(params[:id])
  end

  def show
    @profile = Profile.find(params[:id])
    @user = User.find(@profile.user_id)
    respond_to do |format|
      format.html
      format.json {render :json => @profile}
    end
  end

  def update
    @profile = Profile.find(params[:id])
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
                                    :depatrtmant, :avatar)
  end

end
