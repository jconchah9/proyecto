class CreateCrop < ActiveRecord::Migration[5.0]
  def change
    create_table :crops do |t|
      t.string :name
      t.timestamp :harvest_date
      t.integer :minimum_value
      t.integer :maximum_value
      t.timestamps
    end
  end
end
