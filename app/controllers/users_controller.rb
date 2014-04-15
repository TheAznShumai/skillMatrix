class UsersController < ApplicationController
  load_and_authorize_resource :param_method => :user_params

  def index
    @users = User.where.not(:id => current_user.id).includes(:profile)
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  def edit
  end

  def update
    if @user.update_attributes!(user_params)
      respond_to do |format|
        format.html {redirect_to @user.profile}
      end
    else
      #TODO do a flash
      render nothing: true
    end
  end

  def compose_email
    # Temp mail compose controller for demo purposes
    # TODO - create a mailbox model with proper validations and handlers
    # ALSO IMPORTANT REMEMBER TO SANATIZE the EMAIL PARAMS
    email_params = new_email_params
    email_params[:from] = current_user.email
    UserMailer.send_email(email_params).deliver
    respond_to do |format|
      format.html {render nothing: true}
    end
  end

  private

  def user_params
    params.require(:user).permit(:manager_id,
                                 :profile_attributes =>
                                [:first_name, :last_name,
                                 :title, :office_phone, :cell_phone,
                                 :department, :avatar])
  end

  def new_email_params
    params.require(:email).permit(:to, :cc, :bcc, :subject, :body)
  end
end
