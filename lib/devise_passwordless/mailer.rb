require 'devise/version'

module DevisePasswordless
  module Mailer

    def login_instructions(record, opts={})
      # optional arguments introduced in Devise 2.2.0, remove check once support for < 2.2.0 is dropped.
      if Gem::Version.new(Devise::VERSION.dup) < Gem::Version.new('2.2.0')
        devise_mail(record, :login_instructions)
      else
        devise_mail(record, :login_instructions, opts)
      end
    end
  end
end
