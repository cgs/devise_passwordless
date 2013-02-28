module DevisePasswordless
  module ControllerFilters
    def clear_session_and_check_token
      sign_out resource_name.to_sym
    
      unless resource_class.find_by_authentication_token(params[:auth_token])
        set_flash_message :alert, :invalid_login_url, :scope => "devise.passwordless"
        redirect_to new_passwordless_url(resource_name)
      end
    end
  end
end
