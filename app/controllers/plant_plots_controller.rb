class PlantPlotsController < ApplicationController
  def destroy
    # binding.pry
    plant_plots_id = PlantPlot.find_by(plot_id: params[:plot_id], plant_id: params[:id]).destroy

    redirect_to "/plots"
  end
end
