class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def unique_plants
    plants.select(:name).distinct.where('days_to_harvest < 100')
  end
end
