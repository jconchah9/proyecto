class AddColumnDocumentInDocAnalysis < ActiveRecord::Migration[5.0]
  def change
    add_attachment :document_analyses, :document
  end
end
