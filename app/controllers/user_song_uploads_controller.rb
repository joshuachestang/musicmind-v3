class UserSongUploadsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :xml, :json

  # GET /user_song_uploads/1
  # GET /user_song_uploads/1.json

  def show
    @library = true
    @user_song_uploads = current_user.user_song_uploads.all
    @master_songs = current_user.master_song_ownings.all
    @master_song_relationships = current_user.master_song_relationships.all
    @favoritings = current_user.user_song_uploads.where(:favorite => true).size + current_user.master_song_relationships.where(:favorite => true).size
    @cart = current_cart
    respond_to do |format|
      format.html 
      format.js
    end
  end

  # GET /user_song_uploads/new
  # GET /user_song_uploads/new.json
  def new
    @user_song_upload = UserSongUpload.new
    respond_to do |format|
      format.html
      format.json
      format.js
    end
  end

  # GET /user_song_uploads/1/edit
  def edit
    @user_song_upload = UserSongUpload.find(params[:id])
  end

  # POST /user_song_uploads
  # POST /user_song_uploads.json

  def create
    @user_song_upload = current_user.user_song_uploads.build(params[:user_song_upload])
    if @user_song_upload.save
      respond_to do |format|
        format.html {  
          render :json => [@user_song_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => [@user_song_upload].to_json     
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  

  # PUT /user_song_uploads/1
  # PUT /user_song_uploads/1.json
  def update
    @user_song_upload = UserSongUpload.find(params[:id])

    respond_to do |format|
      if @user_song_upload.update_attributes(params[:user_song_upload])
        format.html { redirect_to user_library_path, notice: 'User song upload was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_song_upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_song_uploads/1
  # DELETE /user_song_uploads/1.json
  def destroy
    @user_song_upload = UserSongUpload.find(params[:id])
    @user_song_upload.destroy

    respond_to do |format|
      format.html { redirect_to user_library_path }
      format.json { head :ok }
    end
  end

  def master_song_owning
    @title = "Your Purchased Songs"
    @user = current_user
    @master_songs = @user.master_song_owning.paginate(:page => params[:page])
  end


  def download
    user_song_upload = current_user.user_song_uploads.find(params[:id])
    #location = "#{Rails.root}" 
    
   # send_file  (@upload)
#send_file('public/test_file.pdf', :filename => 'Test File', :type => 'application/pdf', :disposition => 'attachment', :streaming => 'true', :buffer_size => '4096')
    send_file  user_song_upload.song.path,
    :filename => user_song_upload.song_file_name,
                :type => user_song_upload.song_content_type,
    :disposition => 'attachment'
    flash[:notice] = "Your file has been downloaded"
  end

  def add_favorite_usu
    user_song_upload = current_user.user_song_uploads.find(params[:id])
    user_song_upload.update_attributes(:favorite => true)
    @user_song_upload = user_song_upload
    
    respond_to do |format|
      format.html {redirect_to user_library_path, notice: 'You have favorited a song!'}
      format.js {render :layout => false }
    end
  end
  
  def recently_played
    @recent_user_song_plays = current_user.song_listens.where(:listenable_type => "UserSongUpload")
    @recent_purchased_plays = current_user.song_listens.where(:listenable_type => "MasterSong")
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end
  end

  def favorited
    @favorite_page = true
    @uploaded_favorites = current_user.user_song_uploads.where(:favorite => true)
    @master_favorites = current_user.master_song_relationships.where(:favorite => true)
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end  
  end

  def library_search
    @search_usu = current_user.user_song_uploads.search(params)
    @search_msr = MasterSong.search(params)
      
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end  
  end
end
