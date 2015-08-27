class AddIndexToAreas < ActiveRecord::Migration
  def change
    add_index :areas, :title, unique: true
  end
end
