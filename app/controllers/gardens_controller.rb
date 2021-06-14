class GardensController < ApplicationController
  def show
    @garden = Garden.find(params[:id]).unique_plants
  end
end
