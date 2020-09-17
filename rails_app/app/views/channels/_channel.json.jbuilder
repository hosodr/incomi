json.extract! channel, :id, :parent_channel_id, :parent_comment, :name, :abstract, :created_at, :updated_at
json.url channel_url(channel, format: :json)
