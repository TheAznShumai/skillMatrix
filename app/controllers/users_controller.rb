class UsersController < ApplicationController
  authorize_resource
  def index
    @users = User.where(true).includes(:profile)
  end

  def destroy
    @user = User.where(:id => params[:id]).first
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path }
    end
  end

  def compose_email
    # temp mail compose controller for demo purposes
    # TODO - create a mailbox model with validations
    email = new_email_params
    respond_to do |format|
      format.html {render nothing: true}
    end
  end

  private

  def new_email_params
    params.require(:email).permit(:to, :cc, :bcc, :subject, :body)
  end
end
