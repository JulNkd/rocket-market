class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :rockets, :rating
    remove_column :rockets, :review
  end
end
