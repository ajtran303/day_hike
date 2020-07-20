require "rails_helper"

RSpec.describe "Hiking Index Page Spec" do
  before :each do
    @trips = create_list(:trip, 4)
    @trips.each do |trip|
      trip.trails << create_list(:trail, 4)
    end
  end

  describe "As a visitor" do
    describe "on the hiking trips index page" do
      it "1: there is a list of all hiking trip names in the database" do
        visit "/trips"

        expect(page).to have_content("All Hiking Trips")

        @trips.each do |trip|
          expect(page).to have_content(trip.name)
        end
      end

      it "2: each trip name is a link that goes to that trip's page" do
        @trips.each do |trip|
          visit "/trips"

          expect(page).to have_link(trip.name, href: "/trips/#{trip.id}")
          click_link trip.name
          expect(current_path).to eq("/trips/#{trip.id}")
        end
      end
    end
  end
end
