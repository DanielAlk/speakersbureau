class AddColorToBulatTeamMembers < ActiveRecord::Migration
  def change
    add_column :bulat_team_members, :color, :string
  end
end
