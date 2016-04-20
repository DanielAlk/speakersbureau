json.array!(@bulat_team_members) do |bulat_team_member|
  json.extract! bulat_team_member, :id, :title, :link, :image
  json.url bulat_team_member_url(bulat_team_member, format: :json)
end
