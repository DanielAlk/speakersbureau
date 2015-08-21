class CreateSpeakerAreas < ActiveRecord::Migration
  def change
    create_table :speaker_areas do |t|
      t.references :speaker, index: true, foreign_key: true
      t.references :area, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
