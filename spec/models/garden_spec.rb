require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance method' do
    it 'tests for instance method' do
      garden = Garden.create!(name: "Turing Garden", organic: true)
      garden_2 = Garden.create!(name: "Fake Garden", organic: true)
      plot_3 = garden.plots.create!(number: 3, size: "Large", direction: "South")
      plot_1 = garden.plots.create!(number: 1, size: "Small", direction: "North")
      plot_2 = garden.plots.create!(number: 2, size: "Medium", direction: "East")
      plot_4 = garden_2.plots.create!(number: 5, size: "Extra-Large", direction: "West")
      plant_3 = Plant.create!(name: "Basil", description: "green", days_to_harvest: 15)
      plant_1 = Plant.create!(name: "Carrots", description: "orange", days_to_harvest: 50)
      plant_2 = Plant.create!(name: "Bell Pepper", description: "red", days_to_harvest: 120)
      plant_4 = Plant.create!(name: "Carrots", description: "orange", days_to_harvest: 50)
      plant_5 = Plant.create!(name: "Lemons", description: "yellow", days_to_harvest: 50)

      plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
      plant_plot_4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_1.id)
      plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_2.id)
      plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_3.id)
      plant_plot_5 = PlantPlot.create!(plant_id: plant_5.id, plot_id: plot_4.id)

      actual = garden.unique_plants

      expect(actual.pluck(:name)).to eq([plant_3.name, plant_1.name])
    end
  end
end
