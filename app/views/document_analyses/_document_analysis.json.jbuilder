json.extract! document_analysis, :id, :name, :type, :descripcion, :file_name, :analysis_id, :created_at, :updated_at
json.url document_analysis_url(document_analysis, format: :json)
