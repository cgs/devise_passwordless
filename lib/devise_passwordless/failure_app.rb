module DevisePasswordless
  class FailureApp < Devise::FailureApp
    def scope_path
      opts  = {}
      route = :"new_#{scope}_passwordless_path"
      opts[:format] = request_format unless skip_format?

      config = Rails.application.config
      opts[:script_name] = (config.relative_url_root if config.respond_to?(:relative_url_root))

      context = send(Devise.available_router_name)

      if context.respond_to?(route)
        context.send(route, opts)
      elsif respond_to?(:root_path)
        root_path(opts)
      else
        "/"
      end
    end
  end
end
