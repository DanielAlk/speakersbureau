class CreateSpeakerVideos < ActiveRecord::Migration
  def change
    create_table :speaker_videos do |t|
      t.references :speaker, index: true, foreign_key: true
      t.string :url

      t.timestamps null: false
    end
  end
end
