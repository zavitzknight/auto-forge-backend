class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.integer :user_id
      t.string :make
      t.string :model
      t.integer :year
      t.string :color
      t.integer :miles
      t.string :image
      t.string :cost

      t.timestamps
    end
  end
end
