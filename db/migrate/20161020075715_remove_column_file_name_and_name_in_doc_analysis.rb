class RemoveColumnFileNameAndNameInDocAnalysis < ActiveRecord::Migration[5.0]
  def change
    remove_column :document_analyses, :file_name
  end
end
