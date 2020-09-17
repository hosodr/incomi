json.extract! channel, :id, :name, :abstract, :created_at, :updated_at
json.url channel_url(channel, format: :json)
