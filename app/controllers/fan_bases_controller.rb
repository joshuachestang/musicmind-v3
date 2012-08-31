class FanBasesController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:show]

  # GET /fan_bases
  # GET /fan_bases.json
  def index
    @fan_bases = FanBase.all
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # GET /fan_bases/1
  # GET /fan_bases/1.json
  def show
    @fan_base = FanBase.find(params[:id])
    @master_songs = @fan_base.user.master_songs.all
    @label = @fan_base.label
    @albums = @fan_base.user.albums.all
    respond_to do |format|
      format.html 
      format.js 
    end
  end


  # GET /fan_bases/new
  # GET /fan_bases/new.json
  def new
    @fan_base = FanBase.new
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # GET /fan_bases/1/edit
  def edit
    @fan_base = FanBase.find(params[:id])
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # POST /fan_bases
  # POST /fan_bases.json
  def create
    @fan_base = current_user.build_fan_base(params[:fan_base])

    respond_to do |format|
      if @fan_base.save
        format.html { redirect_to @fan_base, notice: 'Fan base was successfully created.' }
        format.json { render json: @fan_base, status: :created, location: @fan_base }
        format.js { redirect_to @fan_base }
      else
        format.html { render action: "new" }
        format.json { render json: @fan_base.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fan_bases/1
  # PUT /fan_bases/1.json
  def update
    @fan_base = FanBase.find(params[:id])

    respond_to do |format|
      if @fan_base.update_attributes(params[:fan_base])
        format.html { redirect_to @fan_base, notice: 'Fan base was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fan_base.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fan_bases/1
  # DELETE /fan_bases/1.json
  def destroy
    @fan_base = FanBase.find(params[:id])
    @fan_base.destroy

    respond_to do |format|
      format.html { redirect_to fan_bases_url }
      format.json { head :ok }
    end
  end

  def fan_base_followers
    @title =  "Fans"
    @fan_base = FanBase.find(params[:id])
    @fans = @fan_base.fan_base_followers.page(params[:page]).per(10)
    respond_to do |format|
      format.html
      format.js { render 'fan_bases/fans' }
    end
  end

  def recently_added_music
    @title = "Recently Added Music"
    @fan_base = FanBase.find(params[:id])
    @recent_songs = @fan_base.user.master_songs.limit(10)
    render 'recent_fan_base_music'
  end

  def your_fan_bases
    @fan_base_followings = current_user.fan_base_followings.all
    @fan_base = current_user.fan_base
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  def shuffle
    @fan_base = FanBase.all.sample
    @master_songs = @fan_base.user.master_songs.all 
    render :show
  end

  def unreleased_songs
    @fan_base = FanBase.find(params[:id])
    @master_songs = @fan_base.user.master_songs.all
    
    respond_to do |format|
      format.html
      format.js
    end  
  end
end
