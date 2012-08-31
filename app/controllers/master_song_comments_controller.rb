class MasterSongCommentsController < ApplicationController
  respond_to :html, :json, :js, :xml
  before_filter :authenticate_user!
	
  def create
    @comment = current_user.master_song_comments.build(params[:master_song_comment])
    if @comment.save
	  respond_to do |format|
	    format.html
	    format.js {render :layout => false }
      end
    end
  end
end
