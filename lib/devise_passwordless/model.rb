module Devise
  module Models
    module Passwordless
      extend ActiveSupport::Concern

      included do
        expire_auth_token_on_timeout if Devise.expire_auth_token_on_timeout
      end
        
      def send_login_instructions
        send_devise_notification(:login_instructions)
      end

      # TokenAuthenticatable callback
      def after_token_authentication
        reset_authentication_token! if Devise.one_time_token
      end

      module ClassMethods
        def send_login_instructions(params)
          passwordless = find_or_create_by_email(params[:email])
          if passwordless.persisted?
            passwordless.ensure_authentication_token!
            passwordless.send_login_instructions
          end
          passwordless
        end
      end
      
    end
  end
end
