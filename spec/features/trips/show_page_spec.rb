require "rails_helper"

RSpec.describe "Trip Show Page Spec" do
  before :each do
    @trip = create(:trip)

    [100, 200, 300].each do |length|
      @trip.trails << create(:trail, length: length)
    end
  end

  describe "As a visitor" do
    describe "on a trip's show page" do
      it "3: there is a detailed list of the trails on that trip" do
        visit "/trips/#{@trip.id}"

        expect(page).to have_content("All trails on #{@trip.name}")

        @trip.trails.each do |trail|
          within(".trail-#{trail.id}-details") do
            expect(page).to have_content("Name: #{trail.name}")
            expect(page).to have_content("Address: #{trail.address}")
            expect(page).to have_content("Length: #{trail.length}")
          end
        end
      end
    end
  end
end
