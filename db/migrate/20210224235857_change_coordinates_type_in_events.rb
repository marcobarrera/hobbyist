class ChangeCoordinatesTypeInEvents < ActiveRecord::Migration[6.0]
  def change
    change_column :events, :lat, :float
    change_column :events, :lng, :float
  end
end
