require 'rails_helper'

# And I see the names of all mechanics that are working on that park's rides,
# And I see that the list of mechanics is unique

RSpec.describe "Amusement Park Show page" do 
  it "has a name and admission price for that park" do 
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    visit "/amusement_parks/#{@six_flags.id}"

  expect(page).to have_content("Name: Six Flags")
  expect(page).to have_content("Admission: $75")
  end

  it "has a unique list of names of all the mechanics working on that park's rides" do 
    @bob = Mechanic.create!(name: "Bob", years_experience: 10)
    @sal = Mechanic.create!(name: "Sal", years_experience: 5)
    @mike = Mechanic.create!(name: "Mike", years_experience: 3)

    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)

    @rm1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @bob.id)
    @rm2 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @sal.id)
    @rm3 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @mike.id)

    visit "/amusement_parks/#{@six_flags.id}"

    expect(page).to have_content("Bob")
    expect(page).to have_content("Sal")
    expect(page).to have_content("Mike")
  end
end