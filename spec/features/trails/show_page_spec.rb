require "rails_helper"

RSpec.describe "Trail Show Page Spec" do
  before :each do
    @trail = create(:trail)
    @trips = create_list(:trip, 5)
    @trail.trips << @trips
  end

  describe "As a visitor" do
    describe "on the trail show page" do
      it "9-10: there is a detailed list of trips that include this trail" do
        visit "trails/#{@trail.id}"

        expect(page).to have_content("#{@trail.name} (#{@trail.address})")
        expect(page).to have_content("#{@trail.name} was included in #{@trail.trips.size} trips:")

        @trail.trips.each do |trip|
          within(".trip-#{trip.id}") do
            expect(page).to have_content("#{trip.name} (Total Length: #{trip.trails.total_distance})")
          end
        end
      end
    end
  end
end
