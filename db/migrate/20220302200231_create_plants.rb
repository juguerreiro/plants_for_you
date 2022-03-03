class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :specie
      t.integer :price
      t.string :description
      t.integer :quantity
      t.boolean :is_available
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
