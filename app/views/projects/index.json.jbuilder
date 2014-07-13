json.array!(@projects) do |project|
  json.extract! project, :id, :name, :description, :customer_id, :provider_id, :description, :team
  json.url project_url(project, format: :json)
end
