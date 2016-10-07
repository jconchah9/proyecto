json.extract! detail_contrat, :id, :start_date, :end_date, :qty_sensores, :contract_id, :group_id, :sector_id, :created_at, :updated_at
json.url detail_contrat_url(detail_contrat, format: :json)
