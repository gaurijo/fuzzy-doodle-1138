class RemoveMechanicFromRide < ActiveRecord::Migration[5.2]
  def change
    remove_column :rides, :mechanic_id, :bigint
  end
end
