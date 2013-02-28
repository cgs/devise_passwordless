# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'devise_passwordless/version'

Gem::Specification.new do |s|
  s.name         = "devise_passwordless"
  s.version      = DevisePasswordless::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Chris Sepic"]
  s.email        = ["chris@bustoutsolutions.com"]
  s.homepage     = "https://github.com/cgs/devise_passwordless"
  s.summary      = "Passwordless authentication using Devise"
  s.description  = "Allows login via an emailed link"
  s.files        = Dir["{app,config,lib}/**/*"] + %w[MIT-LICENSE README.md]
  s.require_path = "lib"

  s.required_ruby_version     = '>= 1.8.6'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_development_dependency('bundler', '>= 1.1.0')

  {
    'railties' => '~> 3.0',
    'actionmailer' => '~> 3.0',
    'devise'   => '>= 2.1.1'
  }.each do |lib, version|
    s.add_runtime_dependency(lib, *version)
  end

end
