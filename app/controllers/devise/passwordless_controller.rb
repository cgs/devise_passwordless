class Devise::PasswordlessController < DeviseController
  prepend_before_filter :require_no_authentication
  prepend_before_filter { request.env["devise.skip_timeout"] = true }

  def new
    build_resource({})
  end
  
  def create
    self.resource = resource_class.send_login_instructions(resource_params)

    if resource.errors.empty?
      set_flash_message :notice, :send_instructions, :email => self.resource.email
      respond_with({}, :location => new_passwordless_path(resource))
    else
      respond_with_navigational(resource) { render :new }
    end
  end
end
