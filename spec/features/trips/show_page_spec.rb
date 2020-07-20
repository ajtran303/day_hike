require "rails_helper"

RSpec.describe "Trip Show Page Spec" do
  before :each do
    @trip = create(:trip)

    @lengths = [150, 175, 200, 300]

    @trails = @lengths.map do |length|
      create(:trail, length: length)
    end

    @trip.trails << @trails
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

      it "4-7: there are statistics about the trails on that hiking trip" do
        total_distance = @lengths.sum # 825
        average_distance = @lengths.sum / @lengths.size.to_f # 206.25
        longest_trail = @trails.last # 300
        shortest_trail = @trails.first # 150

        visit "/trips/#{@trip.id}"

        within ".statistics" do
          expect(page).to have_content("Total hiking distance: #{total_distance}")
          expect(page).to have_content("Average hiking distance: #{average_distance}")

          within ".longest-trail" do
            expect(page).to have_content("Longest Trail on Trip:")
            expect(page).to have_content("Name: #{longest_trail.name}")
            expect(page).to have_content("Length: #{longest_trail.length}")
          end

          within ".shortest-trail" do
            expect(page).to have_content("Shortest Trail on Trip:")
            expect(page).to have_content("Name: #{shortest_trail.name}")
            expect(page).to have_content("Length: #{shortest_trail.length}")
          end
        end
      end
    end
  end
end
