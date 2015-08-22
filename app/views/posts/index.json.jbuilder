json.array!(@posts) do |post|
  json.extract! post, :id, :title, :body, :video, :slug
  json.url post_url(post, format: :json)
end
