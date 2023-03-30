json.extract! lecture, :id, :name, :description, :category, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
