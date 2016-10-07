class AddColumnDocumentAttachedBudgetDocuments < ActiveRecord::Migration[5.0]
  def change
    add_attachment :budget_documents, :document
  end
end
