json.extract! channel, :id, :parent_channel_id, :parent_comment_id, :name, :abstract, :created_at, :updated_at
json.is_root channel.parent_channel_id==nil

# author Hosoda