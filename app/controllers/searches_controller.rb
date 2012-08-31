class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    if params[:query].present?
    @search_users = User.search(params)
    @search_fan_bases = FanBase.search(params)
    @search_master_songs = MasterSong.search(params)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
  end
end
