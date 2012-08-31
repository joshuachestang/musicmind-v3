class LineItemsController < ApplicationController
  before_filter :authenticate_user!, :except => [:create]
  respond_to :html, :js, :xml, :json
  
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
    respond_to do |format|
      format.html
      format.js
    end  
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end  
  end

  # GET /line_items/new
  # GET /line_items/new.json
  def new
    @line_item = LineItem.new
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end  
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      format.html
      format.js {render :layout => false }
    end  
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    master_song = MasterSong.find(params[:master_song_id])
    @line_item = @cart.add_master_song(master_song.id)
    @master_song = master_song

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item.cart }
        format.json { render json: @line_item, status: :created, location: @line_item }
        format.js {render :layout => false }
      else
        format.html { render action: "new" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.json
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    @cart = current_cart

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :ok }
      format.js  {render layout: false }
    end
  end
end
