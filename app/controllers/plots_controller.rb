class PlotsController < ApplicationController
  def index
    @plots = Plot.all
  end

  def show
    @plot = Plot.find(params[:id])
    @plants = @plot.plants
    @plant_id = @plants.first
    redirect_to controller: 'plant_plots', action: 'index', :plant_id => @plant_id, :plot_id => @plot.id
  end
end
