class OrdersController < ApplicationController
  before_filter :authenticate_user!, :except => [:new]
  respond_to :js, :html, :xml, :json
  
  def new
    @order = Order.new
    @title = "Last Step! Enter Your Payment Information"
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def create
    @order = current_cart.build_order(params[:order])
    @order.ip_address = request.remote_ip
    if @order.save
      if @order.purchase
        respond_to do |format|
          Order.transaction do
            begin
              @order.cart.line_items.all.each do |item|
              current_user.master_song_relationships.create(:owned_id => item.master_song_id)
              end

              format.html {redirect_to root_path, :flash => { :success => "Transaction Success" } }
              format.js { redirect_to user_library_path }
              format.xml{render xml: root_path}

            rescue ActiveRecord::RecordInvalid
              format.html {render :action => "failure" }
              format.js
              format.xml {render :action => "failure"}

            raise ActiveRecord::Rollback
            end
          end
        end
      end
      current_cart.delete
    end
  end
end




