json.extract! course, :id, :name, :major, :price, :grade, :seat, :created_at, :updated_at
json.url course_url(course, format: :json)