module DeviseInvitable
  module Generators
    class DevisePasswordlessGenerator < Rails::Generators::NamedBase
      namespace "devise_passwordless"

      desc "Add :passwordless directive to the given model."
      def inject_devise_invitable_content
        path = File.join("app", "models", "#{file_path}.rb")
        inject_into_file(path, "\n  devise :passwordless, :token_authenticatable, :trackable, :timeoutable", :after => "::Base") if File.exists?(path)
      end

    end
  end
end
