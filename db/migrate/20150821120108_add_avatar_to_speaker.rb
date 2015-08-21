class AddAvatarToSpeaker < ActiveRecord::Migration
  def up
    add_attachment :speakers, :avatar
  end

  def down
    remove_attachment :speakers, :avatar
  end
end
