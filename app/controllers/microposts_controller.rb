class MicropostsController < ApplicationController
  before_filter :authenticate_user!, :only => [:create, :destroy]

  def create
  	@micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      @feed_items = []
      render 'users/index'
    end
  end

  def destroy
  	@micropost.destroy
    redirect_back_or root_path
  end

  private

    def authorized_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to current_user if @micropost.nil?
    end
end