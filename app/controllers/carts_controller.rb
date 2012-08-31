 class CartsController < ApplicationController
  respond_to :html, :xml, :json
  before_filter :authenticate_user!, :except => [:show, :new, :create, :update, :destroy, :remove_from_cart]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = current_cart
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to users_path, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html 
        format.js 
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new
    respond_to do |format|
      format.html 
      format.js 
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.js
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @line_items = @cart.line_items.all
    @cart.destroy

    session[:cart_id] = nil
    respond_to do |format|
      format.html { redirect_to :back , notice: 'Your cart is currently empty.'}
      format.json { head :ok }
      format.js { render :layout => false }
    end
  end

  def remove_from_cart
    @current_cart = current_cart
    @current_item = @current_cart.line_items.find_by_master_song_id(item.master_song_id)
    @current_item.destroy
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
