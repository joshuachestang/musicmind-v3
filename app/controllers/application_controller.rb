class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :define_current_user

    def define_current_user
      User.current_user = current_user
    end
    

    def after_sign_in_path_for(resource)                                                                                                                      
      sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')                                            
      if (request.referer == sign_in_url)                                                                                                                     
        super                                                                                                                                                 
      else                                                                                                                                                    
        request.referer || stored_location_for(resource) || root_path                                                                                         
      end                                                                                                                                                     
    end  

    def after_sign_in_path_for(resource)
        return request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    end       
      

  private

    def current_cart
    	Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    	cart = Cart.create
    	session[:cart_id] = cart.id
    	cart
    end
end
