class ZoosController < ApplicationController
 def index
    @zoos = Zoo.all

    respond_to do |format|
      format.html 
      format.json { render json: @zoos }
    end
  end


  def show
    @zoo = Zoo.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @zoo }
    end
  end

  def new
    @zoo = Zoo.new

    respond_to do |format|
      format.html 
      format.json { render json: @zoo }
    end
  end

  def edit
    @zoo = Zoo.find(params[:id])
  end


  def create
    @zoo = Zoo.new(params[:zoo])

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to @zoo,
          notice: 'zoo was successfully created.' }
        format.json { render json: @zoo, status: :created,
          location: @zoo }
      else
        format.html { render action: "new" }
        format.json { render json: @zoo.errors,
          status: :unprocessable_entity }
      end
    end
  end


  def update
    @zoo = Zoo.find(params[:id])

    respond_to do |format|
      if @zoo.update_attributes(params[:zoo])
        format.html { redirect_to @zoo,
          notice: 'zoo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zoo.errors,
          status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @zoo = Zoo.find(params[:id])
    @zoo.destroy

    respond_to do |format|
      format.html { redirect_to zoos_url }
      format.json { head :no_content }
    end
  end
end
