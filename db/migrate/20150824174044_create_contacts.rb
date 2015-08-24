class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :profession
      t.string :organization
      t.string :city
      t.string :zip_code
      t.string :email
      t.string :phone_number
      t.string :request_details
      t.text :event_details
      t.string :past_events_speaker

      t.timestamps null: false
    end
  end
end
