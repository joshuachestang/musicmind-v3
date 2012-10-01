module ApplicationHelper
  def title
	  base_title = "MusicMind, Connect Through Music."
	  if @title.nil?
	    base_title
	  else
	    "#{base_title} | #{@title}"
	  end
  end

#to allow users to see pages(about, recruit, faq)
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


#Cart actions
  def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end

  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end

  #convert id3 tag length into proper format.
  def convert_seconds_to_time(seconds)
    total_minutes = seconds / 1.minutes
    seconds_in_last_minute = seconds - total_minutes.minutes.seconds
    "#{total_minutes}:#{seconds_in_last_minute}"
  end
#problem with times that have 0 in seconds column of time
  

#twitter sharing links on master song page
    include TweetButton
    include FacebookShare

end




