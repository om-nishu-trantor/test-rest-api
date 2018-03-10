json.extract! tasklisting, :id, :name, :count, :created_at, :updated_at
json.url tasklisting_url(tasklisting, format: :json)
