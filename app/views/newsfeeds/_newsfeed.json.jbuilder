json.extract! newsfeed, :id, :title, :desc, :writer, :image, :status, :link, :viewer, :created_at, :updated_at
json.url newsfeed_url(newsfeed, format: :json)