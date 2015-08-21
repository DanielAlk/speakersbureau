json.array!(@areas) do |area|
  json.extract! area, :id, :title, :slug
  json.url area_url(area, format: :json)
end
