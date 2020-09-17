json.extract! event, :id, :channel_id, :host_user_id, :name, :abstract, :zoom_url, :datetime, :fromdate, :todate, :delete_flag, :created_at, :updated_at
json.url event_url(event, format: :json)
