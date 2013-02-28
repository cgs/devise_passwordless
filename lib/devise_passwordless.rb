ActiveSupport::Inflector.inflections do |inflect|
  inflect.uncountable "passwordless"
end

module DevisePasswordless
  autoload :Mailer, 'devise_passwordless/mailer'
end

require 'devise'
require 'devise_passwordless/routes'
require 'devise_passwordless/controller_filters'
require 'devise_passwordless/rails'

module Devise
  mattr_accessor :expire_auth_token_on_timeout
  @@expire_auth_token_on_timeout = true

  # A login link (containing a token) can only be used one time.
  mattr_accessor :one_time_token
  @@one_time_token =  true
end

Devise.add_module :passwordless, :controller => true, :model => "devise_passwordless/model", :route => {:passwordless => [nil, :new]}
