json.extract! event, :id, :channel_id, :name, :abstract, :zoom_url, :date, :fromdate, :todate, :delete_flag, :created_at, :updated_at
json.url event_url(event, format: :json)
