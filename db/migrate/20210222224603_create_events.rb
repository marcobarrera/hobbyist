class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :address
      t.date :date
      t.string :category
      t.text :description
      t.integer :capacity
      t.integer :lat
      t.integer :lng
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
