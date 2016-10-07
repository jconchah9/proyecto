class CreateRestriction < ActiveRecord::Migration[5.0]
  def change
    create_table :restrictions do |t|
      t.integer :minimum_value
      t.integer :maximum_value
      t.timestamp :harvest_date
      t.boolean :is_active
      t.belongs_to :sector, foreign_key: true
      t.timestamps
    end
  end
end
