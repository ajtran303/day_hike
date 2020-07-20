require "rails_helper"

RSpec.describe Trip do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :end_date }
  end
  describe "associations" do
    it { should have_many :trip_trails }
    it { should have_many(:trails).through(:trip_trails) }
  end
end
