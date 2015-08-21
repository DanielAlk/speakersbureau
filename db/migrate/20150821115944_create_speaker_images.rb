class CreateSpeakerImages < ActiveRecord::Migration
  def change
    create_table :speaker_images do |t|
      t.references :speaker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
