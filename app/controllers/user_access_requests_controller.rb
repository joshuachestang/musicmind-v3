class UserAccessRequestsController < ApplicationController



  def new
    @user_access_request = UserAccessRequest.new
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def create
    @user_access_request = UserAccessRequest.new(params[:user_access_request])
    respond_to do |format|
      if @user_access_request.save
        format.html 
        format.js { render :layout => false }
      else
        format.html
        format.js
      end
    end
  end
end