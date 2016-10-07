class CreateAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :analyses do |t|
      t.text :summary
      t.string :state
      t.references :calendar, foreign_key: true, index: true

      t.timestamps
    end
  end
end
