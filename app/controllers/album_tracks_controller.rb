class AlbumTracksController < ApplicationController


  # GET /album_tracks/1
  # GET /album_tracks/1.json
  def show
    @album_track = AlbumTrack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.js
      format.json { render json: @album_track }
    end
  end

  # GET /album_tracks/new
  # GET /album_tracks/new.json
  def new
    @album_track = AlbumTrack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @album_track }
    end
  end

  # GET /album_tracks/1/edit
  def edit
    @album_track = AlbumTrack.find(params[:id])
  end

  # POST /album_tracks
  # POST /album_tracks.json
  def create
    @master_songs = MasterSong.all
    @album_track = AlbumTrack.new(params[:album_track])

    respond_to do |format|
      if @album_track.save
        format.html { redirect_to @album_track, notice: 'Album track was successfully created.' }
        format.json { render json: @album_track, status: :created, location: @album_track }
      else
        format.html { render action: "new" }
        format.json { render json: @album_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /album_tracks/1
  # PUT /album_tracks/1.json
  def update
    @album_track = AlbumTrack.find(params[:id])

    respond_to do |format|
      if @album_track.update_attributes(params[:album_track])
        format.html { redirect_to @album_track, notice: 'Album track was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album_track.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /album_tracks/1
  # DELETE /album_tracks/1.json
  def destroy
    @album_track = AlbumTrack.find(params[:id])
    @album_track.destroy

    respond_to do |format|
      format.html { redirect_to album_tracks_url }
      format.json { head :no_content }
    end
  end
end
