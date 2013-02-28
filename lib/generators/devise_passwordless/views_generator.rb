require 'generators/devise/views_generator'

module DevisePasswordless
  module Generators
    class PasswordlessViewsGenerator < Rails::Generators::Base
      include ::Devise::Generators::ViewPathTemplates
      hide!
      
      def copy_views
        view_directory :passwordless
      end
    end

    class SimpleFormForGenerator < PasswordlessViewsGenerator
      source_root File.expand_path("../templates/simple_form_for", __FILE__)
      hide!
    end

    class FormForGenerator < PasswordlessViewsGenerator
      source_root File.expand_path("../../../../app/views/devise", __FILE__)
      hide!
    end

    class MailerViewsGenerator < Rails::Generators::Base
      include ::Devise::Generators::ViewPathTemplates
      source_root File.expand_path("../../../../app/views/devise", __FILE__)
      desc "Copies Devise mail erb views to your application."
      hide!

      def copy_views
        view_directory :mailer
      end
    end

    class ViewsGenerator < Rails::Generators::Base
      desc 'Copies all DevisePasswordless views to your application.'
      argument :scope, :required => false, :default => nil, :desc => "The scope to copy views to"

      invoke MailerViewsGenerator

      hook_for :form_builder, :aliases => "-b", :desc => "Form builder to be used", :default => defined?(SimpleForm) ? "simple_form_for" : "form_for"
    end
  end
end
