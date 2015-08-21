json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :name, :last_name, :email, :description, :information, :twitter, :slug
  json.url speaker_url(speaker, format: :json)
end
