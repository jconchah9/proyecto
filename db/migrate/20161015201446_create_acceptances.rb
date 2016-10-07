class CreateAcceptances < ActiveRecord::Migration[5.0]
  def change
    create_table :acceptances do |t|
      t.text :summary
      t.string :state
      t.references :budget, foreign_key: true, index: true

      t.timestamps
    end
  end
end
