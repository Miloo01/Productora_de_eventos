json.extract! concert, :id, :date, :place, :participants, :references, :created_at, :updated_at
json.url concert_url(concert, format: :json)
