class CreateDocumentAnalyses < ActiveRecord::Migration[5.0]
  def change
    create_table :document_analyses do |t|
      t.string :name
      t.string :type
      t.text :descripcion
      t.string :file_name
      t.references :analysis, foreign_key: true, index: true
      t.timestamps
    end
  end
end
