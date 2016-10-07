class ModifyColumnNameTypeByTypefileDocAnalysis < ActiveRecord::Migration[5.0]
  def change
    rename_column :document_analyses, :type, :type_file
  end
end
