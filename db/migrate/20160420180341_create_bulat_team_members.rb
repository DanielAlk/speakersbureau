class CreateBulatTeamMembers < ActiveRecord::Migration
  def change
    create_table :bulat_team_members do |t|
      t.string :title
      t.string :link
      t.attachment :image

      t.timestamps null: false
    end
  end
end
