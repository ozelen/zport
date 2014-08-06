json.array!(@skills) do |skill|
  json.extract! skill, :id, :name, :rate, :categoty_id, :skillable_type, :skillable_id
  json.url skill_url(skill, format: :json)
end
