 class SongListensController < ApplicationController
  respond_to :html, :xml, :json, :js
  

  def create
  	@song_listen = current_user.song_listens.build(params[:song_listen]) do |sl|
      sl.listenable_id = params[:songid]
      sl.listenable_type = params[:songtype]
    end
  	@song_listen.save
  	respond_to do |format|
      format.html { render :nothing => true }
    end
  end
end

  