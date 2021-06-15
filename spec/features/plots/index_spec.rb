require 'rails_helper'

RSpec.describe 'Plot Index' do
  describe 'index page' do
    it 'can see the list of all plot numbers & names of plots plants' do
      garden = Garden.create!(name: "Turing Garden", organic: true)
      plot_3 = garden.plots.create!(number: 3, size: "Large", direction: "South")
      plot_1 = garden.plots.create!(number: 1, size: "Small", direction: "North")
      plot_2 = garden.plots.create!(number: 2, size: "Medium", direction: "East")
      plant_3 = Plant.create!(name: "Basil", description: "green", days_to_harvest: 15)
      plant_1 = Plant.create!(name: "Carrots", description: "orange", days_to_harvest: 50)
      plant_2 = Plant.create!(name: "Bell Pepper", description: "red", days_to_harvest: 100)

      plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
      plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_2.id)
      plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_3.id)

      visit "/plots"

      expect(page).to have_content(plot_1.number)
      expect(page).to have_content(plot_2.number)
      expect(page).to have_content(plot_3.number)
      expect(page).to have_content(plant_1.name)
      expect(page).to have_content(plant_2.name)
      expect(page).to have_content(plant_3.name)
      expect(plant_3.name).to appear_before(plant_2.name)
    end

    it 'can remove a plant from a plot' do
      garden = Garden.create!(name: "Turing Garden", organic: true)
      plot_3 = garden.plots.create!(number: 3, size: "Large", direction: "South")
      plot_1 = garden.plots.create!(number: 1, size: "Small", direction: "North")
      plot_2 = garden.plots.create!(number: 2, size: "Medium", direction: "East")
      plant_3 = Plant.create!(name: "Basil", description: "green", days_to_harvest: 15)
      plant_1 = Plant.create!(name: "Carrots", description: "orange", days_to_harvest: 50)
      plant_2 = Plant.create!(name: "Bell Pepper", description: "red", days_to_harvest: 100)

      plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
      plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_2.id)
      plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_1.id)

      visit "/plots"
      within("#plot-#{plot_1.id}") do
        expect(page).to have_link("Remove #{plant_3.name}")
      end
      within("#plot-#{plot_1.id}") do
        expect(page).to have_link("Remove #{plant_1.name}")
      end
      within("#plot-#{plot_2.id}") do
        expect(page).to have_link("Remove #{plant_2.name}")
      end

      within("#plot-#{plot_1.id}") do
        click_link "Remove #{plant_1.name}"
        expect(current_path).to eq("/plots")
        expect(page).to_not have_content(plant_1.name)
      end
    end
  end
end
