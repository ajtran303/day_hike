class Trip < ApplicationRecord
  validates_presence_of :name
  # validates_presence_of :start_date
  # validates_presence_of :end_date

  has_many :trip_trails
  has_many :trails, through: :trip_trails
end
