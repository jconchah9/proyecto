class RemoveColumnTypeFileNameInBuggetDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :budget_documents, :type
    remove_column :budget_documents, :file_name
  end
end
