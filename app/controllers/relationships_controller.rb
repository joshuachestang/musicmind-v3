class RelationshipsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :xml, :json

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_to do |format|
      format.html 
      format.js { render :layout => false }
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html 
      format.js { render :layout => false }
    end
  end
end