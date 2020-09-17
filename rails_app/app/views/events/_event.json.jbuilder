json.extract! event, :id, :channel_id, :name, :abstract, :zoom_url, :host_date, :from_date, :to_date, :is_delete, :created_at, :updated_at
json.url event_url(event, format: :json)
