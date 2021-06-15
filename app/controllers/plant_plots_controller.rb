class PlantPlotsController < ApplicationController
  def index
    plant_plots_id = PlantPlot.find_by(plot_id: params[:plot_id], plant_id: params[:plant_id]).destroy

    redirect_to "/plots"
  end
end
