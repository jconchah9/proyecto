class CreatePlants < ActiveRecord::Migration[5.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :commune
      t.string :city
      t.references :company, foreign_key: true, index: true

      t.timestamps
    end
  end
end
