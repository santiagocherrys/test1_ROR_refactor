json.extract! publication, :id, :title, :description, :category_id, :status, :user_id, :created_at, :updated_at
json.url publication_url(publication, format: :json)
