require "rails_helper"

RSpec.describe TripTrail do
  describe "associations" do
    it { should belong_to :trail }
    it { should belong_to :trip }
  end
end
