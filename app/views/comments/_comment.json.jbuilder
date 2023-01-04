json.extract! comment, :id, :blog_id, :content, :created_at, :updated_at
json.url comment_url(comment, format: :json)
