json.extract! booking_week, :id, :week, :title, :created_at, :updated_at
json.url booking_week_url(booking_week, format: :json)