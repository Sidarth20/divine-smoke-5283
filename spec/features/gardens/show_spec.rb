require 'rails_helper'

RSpec.describe 'Garden Show' do
  describe 'show page' do
    it 'can see the list of plants in gardens plots, unique, less than 100 days to harvest' do
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

      visit "/gardens/#{garden.id}"

      expect(page).to have_content(plant_1.name, count: 1) #this ensures that the duplicate name in plant 4 isn't showing up
      expect(page).to_not have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
      # expect(page).to_not have_content(plant_4)
      expect(page).to_not have_content(plant_5.name)
    end
  end
end
