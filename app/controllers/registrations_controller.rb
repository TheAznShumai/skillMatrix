class RegistrationsController < Devise::RegistrationsController

  def create
    #sign_up_params have been sanitized in application controller
    build_resource(sign_up_params)
    if resource.save
      flash.clear
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        render_format("success")
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        render_format("confirmation")
      end
    else
      flash[:error] = resource.errors.full_messages.uniq.join("\n")
      clean_up_passwords resource
      render_format("failure")
    end
  end

  def render_format(action="failure")
    respond_to do |format|
      format.html { super }
      format.js { render :action => action }
    end
  end

end

