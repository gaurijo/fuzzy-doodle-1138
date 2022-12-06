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
end