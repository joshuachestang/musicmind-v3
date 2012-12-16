class MasterSongsController < ApplicationController
  respond_to :html, :json, :js, :xml
  before_filter :authenticate_user!, :except => [:show, :index, :most_upvoted, :trending, :free, :most_listened_to, :newly_added]
  after_filter :set_access_control_headers
 
 def set_access_control_headers
   headers['Access-Control-Allow-Origin'] = '*'
   headers['Access-Control-Request-Method'] = '*'
 end
  # GET /master_songs
  # GET /master_songs.json
  def index
    @newly_added_songs = MasterSong.newly.page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def newly_added
    @newly_added_songs = MasterSong.newly.page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
    end
  end

  
  def most_upvoted
    @upvoted = true
    @most_upvoted_songs = MasterSong.upvoted.page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
      format.xml  { render :xml => @most_upvoted_songs } 
    end
  end

  def trending
    @trending = true
    @trending_songs = MasterSong.trended.page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
      format.xml  { render :xml => @trending_songs } 
    end
  end

  def free
    @free = true
    @free_songs = MasterSong.free.order("created_at DESC").page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
    end
  end

  def most_listened_to
    @most_listened = true
    @most_listened_to_songs = MasterSong.most_listened.page(params[:page]).per(12)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
      format.xml  { render :xml => @most_listened_to_songs } 
    end
  end

  def most_recently_added_to_library
  end


  # GET /master_songs/1
  # GET /master_songs/1.json
  def show
    @master_song = MasterSong.find(params[:id])
    @fan_base = @master_song.user.fan_base
    @owners = @master_song.owners.count(:owner_id)
    @comments = @master_song.master_song_comments.order('created_at DESC')
    @new_comment = @master_song.master_song_comments.build

    respond_to do |format|
      format.js
      format.html # show.html.erb
      format.json do
        body = render_to_string(:locals => {:master_song => @master_song})
        render :json => "{ \"html\" :  \"#{to_json_value(body)}\"}", :callback => params[:callback]
      end
    end
  end

  def to_json_value(str)
    str.gsub!("\"", "\\\"")
    str.gsub!(/\n+/, " ")
    str
  end

  # GET /master_songs/new
  # GET /master_songs/new.json
  def new
    @master_song = MasterSong.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @master_song }
    end
  end

  # GET /master_songs/1/edit
  def edit
    @master_song = MasterSong.find(params[:id])
    respond_to do |format|
      format.html
      format.js
    end  
  end

  # POST /master_songs
  # POST /master_songs.json
  def create
    @master_song = current_user.master_songs.build(params[:master_song])
    @fan_base = @master_song.user.fan_base
    respond_to do |format|
      if @master_song.save
        format.html { redirect_to @master_song, notice: 'Master song was successfully created.' }
        format.js { redirect_to @master_song, :id => "page-link" }
        format.json { render json: @master_song, status: :created, location: @master_song }
      else
        format.html { render action: "new" }
        format.js
        format.json { render json: @master_song.errors, status: :unprocessable_entity }
        format.jsm { render_js_message(:error, :message => "MasterSong could not be saved. Please check your form") }
      end
    end
  end

  # PUT /master_songs/1
  # PUT /master_songs/1.json
  def update
    @master_song = MasterSong.find(params[:id])

    respond_to do |format|
      if @master_song.update_attributes(params[:master_song])
        format.html { redirect_to @master_song, notice: 'Master song was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @master_song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /master_songs/1
  # DELETE /master_songs/1.json
  def destroy
    @master_song = MasterSong.find(params[:id])
    @master_song.destroy

    respond_to do |format|
      format.html { redirect_to master_songs_url }
      format.json { head :ok }
    end
  end

  def increment
     MasterSong.find(params[:id]).listens += 1
     respond_to do |formmat|
      format.js
    end
  end

  def master_song_owners
    @title = "Owners"
    @master_song = MasterSong.find(params[:id])
    @master_songs = @master_song.master_song_owners.paginate(:page => params[:page])
    render 'show_master_song_owners'
    respond_to do |format|
      format.html
      format.js { render 'master_songs/show_master_song_owners'}
    end  
  end

  def music_player_widget
  end

  def add_album_song
    @master_song = MasterSong.new 
    @albums = current_user.albums.all
    @hello_world = "Hello World!!!"
    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @master_song }
    end
  end

end