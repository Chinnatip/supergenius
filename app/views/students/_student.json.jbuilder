json.extract! student, :id, :name, :surname, :grade, :school, :parent, :email, :tel, :line, :facebook, :created_at, :updated_at
json.url student_url(student, format: :json)