class AmusementPark < ApplicationRecord
  has_many :rides
  # has_many :mechanics, through: :rides 

  def park_mechanics
    rides.map {|ride| ride.mechanics}.flatten.uniq.map {|m| m.name }
  end
end