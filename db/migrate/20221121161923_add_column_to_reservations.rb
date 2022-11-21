class AddColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :travelers, :integer
  end
end
