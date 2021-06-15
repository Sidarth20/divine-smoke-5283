class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def show
    @plot = Plot.find(params[:id])
    @plants = @plot.plants
    # @plant_id = @plants.find(params[:id]).id  this broke once I finished user story 3
    # binding.pry
    @plant_id = @plants.first.id
    # @plot.plants.delete(Plant.find(params[:id])) this deletes the record entirely
    # need to delete the association, will try to redirect to joins table
    redirect_to controller: 'plant_plots', action: 'index', :plant_id => @plant_id, :plot_id => @plot.id
  end
end
