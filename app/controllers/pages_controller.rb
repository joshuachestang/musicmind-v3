class PagesController < ApplicationController
  
  def about
  	 respond_to do | format | 
        format.html 
        format.js 
    end
  end

  def recruiting
  	 respond_to do | format |  
        format.html
        format.js
    end
  end

  def help
  	 respond_to do | format |  
        format.html
        format.js
    end
  end

  def artist_info
    respond_to do |format|
      format.html
      format.js
    end
  end  
end
