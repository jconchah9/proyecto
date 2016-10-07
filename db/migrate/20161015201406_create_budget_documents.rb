class CreateBudgetDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :budget_documents do |t|
      t.string :name
      t.string :type
      t.text :description
      t.string :file_name
      t.references :budget, foreign_key: true, index: true

      t.timestamps
    end
  end
end
