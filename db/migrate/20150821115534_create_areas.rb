class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :title
      t.string :slug

      t.timestamps null: false
    end
    add_index :areas, :slug, unique: true
  end
end
