json.extract! budget_document, :id, :name, :type, :descripcion, :file_name, :budget_id, :created_at, :updated_at
json.url budget_document_url(budget_document, format: :json)
