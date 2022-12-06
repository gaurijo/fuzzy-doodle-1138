# Story 1 - Mechanic Show Page

# As a user,
# When I visit a mechanic show page
# I see their name, years of experience, and the names of all rides they are working on

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
    expect(page).to have_content("Rides: Death Spiral, Life Twirl")
  end
end