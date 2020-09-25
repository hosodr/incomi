class AddParentchannelToChannels < ActiveRecord::Migration[5.0]
  def change
    add_reference :channels, :parent_channel, foreign_key: { to_table: :channels }, optional: true
  end
end
# author: hosoda
