class LabelsController < ApplicationController
    respond_to :html, :xml, :json
    before_filter :authenticate_user!


	def index
	  @labels = Label.all
	  respond_to do |format|
      format.html
      format.js
    end  	
	end

	def show
	  @label = Label.find(params[:id])
	  respond_to do |format|
      format.html
      format.js
    end  
	end

	def new
      @label = Label.new(:fan_base_id => params[:fan_base_id])
      respond_to do |format|
      	format.html
      	format.js
      end
    end

	def create
      @fan_base = FanBase.find(params[:fan_base_id])
      @label = @fan_base.build_label(params[:label])

      respond_to do |format|
	    if @label.save
	      format.html { redirect_to root_path, notice: 'Label was successfully added to this fan base.' }
	      format.json { render json: root_path, status: :created }
	      format.js { redirect_to @fan_base }
	    else
	      format.html { render action: "new" }
	      format.json { render json: @label.errors, status: :unprocessable_entity }
        end
      end		
	end

	def update
	    @label = Label.find(params[:id])

	    respond_to do |format|
	      if @label.update_attributes(params[:label])
	        format.html { redirect_to @fan_base, notice: 'Label was successfully updated.' }
	        format.json { head :ok }
	      else
	        format.html { render action: "edit" }
	        format.json { render json: @label.errors, status: :unprocessable_entity }
	      end
	    end
    end

	def destroy
    @label = Label.find(params[:id])
    @label.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :ok }
    end
  end
end
