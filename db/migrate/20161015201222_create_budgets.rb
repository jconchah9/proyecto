class CreateBudgets < ActiveRecord::Migration[5.0]
  def change
    create_table :budgets do |t|
      t.string :state
      t.text :summary
      t.references :analysis, foreign_key: true
      t.timestamps
    end
  end
end
