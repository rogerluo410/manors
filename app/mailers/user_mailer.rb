class UserMailer < ActionMailer::Base
  default :from => "rogerluo410@gmail.com"

  
  def registration_confirmation
    mail(:to => "rogerluo410@gmail.com", :subject => "Exception")
  end
end