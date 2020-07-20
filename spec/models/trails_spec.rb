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

  before :each do
    @trip = create(:trip)
    @trails = [300, 175, 200, 150].map do |length|
      create(:trail, length: length)
    end
    @trip.trails << @trails
  end

  describe "methods" do
    it ".total_distance" do
      expect(@trip.trails.total_distance).to eq(825)
    end

    it ".average_distance" do
      expect(@trip.trails.average_distance).to eq(206.25)
    end

    it ".longest_trail" do
      expect(@trip.trails.longest_trail).to eq(@trails.first)
    end

    it ".shortest_trail" do
      expect(@trip.trails.shortest_trail).to eq(@trails.last)
    end
  end
end
