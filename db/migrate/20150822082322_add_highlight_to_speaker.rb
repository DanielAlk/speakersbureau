class AddHighlightToSpeaker < ActiveRecord::Migration
  def change
    add_column :speakers, :visible_on_home, :boolean
  end
end
