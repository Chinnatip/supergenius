json.extract! booking_reason, :id, :reason, :ref_code, :created_at, :updated_at
json.url booking_reason_url(booking_reason, format: :json)