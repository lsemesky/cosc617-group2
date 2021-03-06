class AnimalsController < ApplicationController
 def index

    @animals = Animal.where(:zoo_id => params[:zoo_id])   #this is the index method
    @species = @animals.group_by {|animal| animal.animal_type}
    @zoo = Zoo.find(params[:zoo_id])
    @id = params[:id]
    if @id
      @animal = Animal.find(@id)
    end
    if @animal
   @mates = @animal.compatible_mates
   end


    respond_to do |format|

      format.html # index.html.erb
      format.json { render json: @animals }
      format.js
    end
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    @animal = Animal.find(params[:id])
    
    @zoo = Zoo.find(params[:zoo_id])
    @father = @animal.father
    @mother = @animal.mother
    @children = @animal.children
    @siblings = @animal.siblings
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/new
  # GET /animals/new.json
  def new
    @animal = Animal.new
    @zoo = Zoo.find(params[:zoo_id])
     @species = ['Lion', 'Koala', 'Panda']

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @animal }
    end
  end

  # GET /animals/1/edit
  def edit
    @animal = Animal.find(params[:id])
    @zoo = Zoo.find(params[:zoo_id])
    @species = ['Lion', 'Koala', 'Panda']
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(params[:animal])
    @species = ['Lion', 'Koala', 'Panda']
    @zoo = Zoo.find(params[:zoo_id])
    @animal.zoo_id = params[:zoo_id];
    

    respond_to do |format|

      if @animal.save
        format.html { redirect_to zoo_animal_path(params[:zoo_id],@animal.id),
          notice: 'animal was successfully created.' }
        format.json { render json: @animal, status: :created,
          location: @animal }
      else
        format.html { render action: "new" }
        format.json { render json: @animal.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /animals/1
  # PUT /animals/1.json
  def update
    @animal = Animal.find(params[:id])
    @species = ['Lion', 'Koala', 'Panda']
    @zoo = Zoo.find(params[:zoo_id])

    respond_to do |format|

    if @animal.update_attributes(params[:animal])
        format.html { redirect_to zoo_animal_path(params[:zoo_id],@animal.id),
          notice: 'animal was successfully updated.' }
        format.json { head :no_content }
    else

        format.html { render action: "edit"}
        format.json { render json: @animal.errors,
          status: :unprocessable_entity }
    end
   end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal = Animal.find(params[:id])
    @animal.destroy

    respond_to do |format|
      format.html { redirect_to zoo_animals_url }
      format.json { head :no_content }
    end
  end
  


end