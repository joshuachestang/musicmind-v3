class FanRelationshipsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :xml, :json

  def create
    @fan_base = FanBase.find(params[:fan_relationship][:followed_id])
    current_user.follow_fan_base!(@fan_base)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
    end
  end

  def destroy
    @fan_base = FanRelationship.find(params[:id]).followed
    current_user.unfollow_fan_base!(@fan_base)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
    end
  end
end