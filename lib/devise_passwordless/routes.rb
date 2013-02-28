module ActionDispatch::Routing
  class Mapper

  protected
    def devise_passwordless(mapping, controllers)
      resource :passwordless, :only => [:new, :create],
        :path => mapping.path_names[:passwordless], :controller => controllers[:passwordless]
    end
  end
end
