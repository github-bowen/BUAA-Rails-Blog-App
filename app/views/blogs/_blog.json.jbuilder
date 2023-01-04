json.extract! blog, :id, :content, :votes, :created_at, :updated_at
json.url blog_url(blog, format: :json)
