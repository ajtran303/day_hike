require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }
  end

  describe "associations" do
    it { should have_many :trip_trails }
    it { should have_many(:trips).through(:trip_trails) }
  end

  describe "methods" do
    it ".total_distance" do
      trip = create(:trip)
      trip.trails << [150, 175, 200, 300].map do |length|
        create(:trail, length: length)
      end

      expect(trip.trails.total_distance).to eq(825)

      DatabaseCleaner.clean
    end
  end
end
