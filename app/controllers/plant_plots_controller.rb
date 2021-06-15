class PlantPlotsController < ApplicationController
  def index
    @plant_id = params[:id]
    # redirect_to controller: 'plant_plots', action: 'destroy', :id => @plant_id
    # binding.pry
    plant_plots = PlantPlot.all
    plant_plots_id = PlantPlot.find_by(plot_id: params[:plot_id], plant_id: params[:plant_id]).destroy
    # plant_plots_id.delete_at(PlantPlot.find_by(plant_id: params[:id]))

    redirect_to "/plots"
  end

  def destroy

  end
end
