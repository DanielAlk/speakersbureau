class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :description
      t.text :information
      t.string :twitter
      t.string :slug

      t.timestamps null: false
    end
    add_index :speakers, :slug, unique: true
  end
end
