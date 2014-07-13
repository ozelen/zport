json.array!(@jobs) do |job|
  json.extract! job, :id, :title, :description, :since, :till, :company_id, :person_id
  json.url job_url(job, format: :json)
end
