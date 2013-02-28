module DevisePasswordless
  class Engine < ::Rails::Engine
    initializer "controller filters" do
      ActiveSupport.on_load :action_controller do
        include DevisePasswordless::ControllerFilters
      end
    end
    
    config.to_prepare do
      require 'devise/mailer'
      Devise::Mailer.send :include, DevisePasswordless::Mailer

      Devise::SessionsController.prepend_before_filter :clear_session_and_check_token, only: :new

      # app routes need to be available
      require 'devise_passwordless/failure_app'
    end
  end
end
