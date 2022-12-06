  # Story 2 - Add a Ride to a Mechanic

# As a user,
# When I go to a mechanic's show page
# I see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and click Submit
# I’m taken back to that mechanic's show page
# And I see the name of that newly added ride on this mechanic's show page

require 'rails_helper'

RSpec.describe "Mechanic Show Page" do 
  it "has a mechanic's name, years of experience, and names of their rides" do
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 60)
    @ride_1 = Ride.create!(name: "Death Spiral", thrill_rating: 4, open: true, amusement_park_id: @six_flags.id)
    @ride_2 = Ride.create!(name: "Life Twirl", thrill_rating: 1, open: true, amusement_park_id: @six_flags.id)
    @bob = Mechanic.create!(name: "Bob", years_experience: 10)
    @rm1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @bob.id)
    @rm2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @bob.id)
    
    visit "/mechanics/#{@bob.id}"

    expect(page).to have_content("Name: #{@bob.name}")
    expect(page).to have_content("Years of Experience: #{@bob.years_experience}")
    expect(page).to have_content("Current Rides: Death Spiral")
    expect(page).to have_content("Life Twirl")
  end

  it "has a form to add a ride to a mechanic's workload" do 
    @six_flags = AmusementPark.create!(name: "Six Flags", admission_cost: 60)
    @ride_1 = Ride.create!(name: "Death Spiral", thrill_rating: 4, open: true, amusement_park_id: @six_flags.id)
    @ride_2 = Ride.create!(name: "Life Twirl", thrill_rating: 1, open: true, amusement_park_id: @six_flags.id)
    @scrambler = Ride.create!(name: 'The Scrambler', thrill_rating: 4, open: true, amusement_park_id: @six_flags.id)
    @bob = Mechanic.create!(name: "Bob", years_experience: 10)
    @rm1 = RideMechanic.create!(ride_id: @ride_1.id, mechanic_id: @bob.id)
    @rm2 = RideMechanic.create!(ride_id: @ride_2.id, mechanic_id: @bob.id)

    visit "/mechanics/#{@bob.id}"
    fill_in :ride_id, with: "#{@scrambler.id}"

    click_on "Submit"
    
    expect(current_path).to eq("/mechanics/#{@bob.id}")
    expect(page).to have_content(@scrambler.name)
  end
end