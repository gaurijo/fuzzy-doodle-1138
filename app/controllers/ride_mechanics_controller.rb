class RideMechanicsController < ApplicationController
  def create
    ride = Ride.find(params[:ride_id])
    mechanic = Mechanic.find(params[:id])
    rm = RideMechanic.create(ride_id: ride.id, mechanic_id: mechanic.id)
    redirect_to "/mechanics/#{params[:id]}"
  end
  # private 
  # def ride_mechanic_params
  #   params.permit(:ride_id, :mechanic_id)
  # end
end