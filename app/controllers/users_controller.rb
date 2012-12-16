class UsersController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
  	 
  # GET /users
  # GET /users.json
  def index
    @user = current_user
    @activities = PublicActivity::Activity.all
    @micropost = Micropost.new
    @feed_items = current_user.feed.page(params[:page])
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
      format.js
    end    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @cart = current_cart
    @recent_master_song_ownings = @user.master_song_ownings.limit(7)
    @recently_joined_fan_bases = @user.fan_base_followings.limit(7)
    @recent_up_votes = @user.song_up_votes.limit(7)
    @recent_follows = @user.following.limit(7)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.js
    end
  end


  def fan_base_following
    @title = "Fan Bases"
    @user = User.find(params[:id])
    @fan_bases = @user.fan_base_followings.page(params[:page])
    @recent_fan_bases = @user.fan_base_followings.limit(5)
    respond_to do |format|
      format.html 
      format.js { render 'users/show_fan_base_follow' }
    end
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page(params[:page])
    respond_to do |format|
      format.html
      format.js { render 'users/show_follow' }
    end
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page])
    respond_to do |format|
      format.html 
      format.js {render 'users/show_follow'}
    end
  end

  def notifications
    @title = "Your Notifications"
    @new_notifications = MasterSong.unread_by(current_user).order("created_at DESC")
    @all_notifications = MasterSong.with_read_marks_for(current_user).order("created_at DESC")
    @new_notifications_count = MasterSong.unread_by(current_user).count

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.js
    end
  end

  def mark_read
    @mark_as_all_read = MasterSong.mark_as_read! :all, :for => current_user
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
      format.js { render :layout => false }
    end
  end
end

