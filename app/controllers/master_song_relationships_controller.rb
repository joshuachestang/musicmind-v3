class MasterSongRelationshipsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :html, :js, :xml, :json
  def create
    @master_song = MasterSong.find(params[:master_song_relationship][:owned_id])
    current_user.own!(@master_song)
    respond_to do |format|
      format.html 
      format.js {render :layout => false }
    end
  end


  def destroy
    @master_song = MasterSongRelationship.find(params[:id]).followed
    current_user.unown_master_song(@master_song)
    respond_with(@user)
  end

  def add_favorite_msr
    master_song_relationship = current_user.master_song_relationships.find(params[:id])
    master_song_relationship.update_attributes(:favorite => true)
    @master_song_relationship = master_song_relationship
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end
  end
end