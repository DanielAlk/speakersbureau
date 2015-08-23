class AddTitleToSpeakerVideo < ActiveRecord::Migration
  def change
    add_column :speaker_videos, :title, :string
  end
end
