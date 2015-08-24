json.array!(@contacts) do |contact|
  json.extract! contact, :id, :name, :profession, :organization, :city, :zip_code, :email, :phone_number, :request_details, :event_details, :past_events_speaker
  json.url contact_url(contact, format: :json)
end
