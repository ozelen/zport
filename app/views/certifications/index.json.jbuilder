json.array!(@certifications) do |certification|
  json.extract! certification, :id, :name, :description, :link, :value, :max_value
  json.url certification_url(certification, format: :json)
end
