class UserMailer < ActionMailer::Base
  def send_email(email_params)
    @body = email_params[:body]
    mail(:from => email_params[:from], :to => email_params[:to], :cc => email_params[:cc],
         :bcc => email_params[:bcc], :subject => email_params[:subject])
  end
end
