json.array!(@pages) do |page|
  json.extract! page, :id, :slug, :title, :name, :content
  json.url page_url(page, format: :json)
end
