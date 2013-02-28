# redirects to passwordless login page on failure instead of Devise's sessions#new
Devise.setup do |config|
  config.warden do |manager|
    manager.failure_app = DevisePasswordless::FailureApp
  end
end
