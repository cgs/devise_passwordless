module DevisePasswordless
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Add DevisePasswordless config variables to the Devise initializer and copy DeviseInvitable locale files to your application."

      def add_config_options_to_initializer
        devise_initializer_path = "config/initializers/devise.rb"
        if File.exist?(devise_initializer_path)
          old_content = File.read(devise_initializer_path)

          if old_content.match(Regexp.new(/^\s# ==> Configuration for :passwordless\n/))
            false
          else
            inject_into_file(devise_initializer_path, :before => "  # ==> Configuration for :confirmable\n") do
<<-CONTENT
  # ==> Configuration for :passwordless
  # Expires the authentication token when the session times out.
  # Default: true
  # config.expire_auth_token_on_timeout = false

  # Whether or not a login link can only be used once.
  # Default: true
  # config.one_time_token = false

CONTENT
            end
          end
        end
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/devise_passwordless.en.yml"
      end

    end
  end
end
