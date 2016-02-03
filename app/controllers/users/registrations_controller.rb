class Users::RegistrationsController <  Devise::RegistrationsController
  skip_before_filter :verify_authenticity_token, only: [:destroy]

end