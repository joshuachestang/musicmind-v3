class SongUpVotesController < ApplicationController

  # POST /song_up_votes
  # POST /song_up_votes.json
  def create
    @song_up_vote = current_user.song_up_votes.build(params[:song_up_upvote]) do |l|
      l.master_song_id = params[:master_song_id]
    end
    @song_up_vote.save 

    respond_to do |format|
      if @song_up_vote.save
        format.html { redirect_to :back, notice: 'Song up vote was successfully created.' }
        format.json { render json: @song_up_vote, status: :created, location: @song_up_vote }
        format.js { render :layout => false }
      else
        format.html { render action: "new" }
        format.json { render json: @song_up_vote.errors, status: :unprocessable_entity }
        format.js { render :layout => false }
      end
    end
  end


  # DELETE /song_up_votes/1
  # DELETE /song_up_votes/1.json
  def destroy
    @song_up_vote = SongUpVote.find(params[:id])
    @song_up_vote.destroy

    respond_to do |format|
      format.html { redirect_to song_up_votes_url }
      format.json { head :no_content }
    end
  end
end
