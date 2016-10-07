json.extract! client, :id, :nombre, :empresa, :telefono, :celular, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
