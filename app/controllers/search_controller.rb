class SearchController < ApplicationController
  
  def index
    @zoos = Zoo.search(params[:search]).order(:name)
    @animals = Animal.search(params[:search])
    @species = @animals.group_by {|animal| animal.animal_type}
   
    @users = User.search(params[:search]).order(:name).page(params[:page])
  end
end
