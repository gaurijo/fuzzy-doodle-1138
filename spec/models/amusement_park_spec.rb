require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'relationships' do
    it { should have_many(:rides) }
    # it { should have_many(:mechanics).through(:rides)}
    end

  describe 'methods' do 
    it 'can retrieve a unique list of mechanic names working on its rides' do 
      @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75) #park

      @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true) #rides
      @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

      @bob = Mechanic.create!(name: "Bob", years_experience: 10) #mechanics
      @sal = Mechanic.create!(name: "Sal", years_experience: 5)
      @carl = Mechanic.create!(name: "Carl", years_experience: 3)
      
      @rm1 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @bob.id) #ride-mechanic-association
      @rm2 = RideMechanic.create!(ride_id: @hurler.id, mechanic_id: @sal.id)
      @rm3 = RideMechanic.create!(ride_id: @scrambler.id, mechanic_id: @carl.id) #sad path instance


      expect(@six_flags.park_mechanics).to eq([@bob.name, @sal.name, @carl.name])
    end
  end
end