class CreateSectors < ActiveRecord::Migration[5.0]
  def change
    create_table :sectors do |t|
      t.string :name
      t.references :plant, foreign_key: true, index: true

      t.timestamps
    end
  end
end
