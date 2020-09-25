class AddParentcommentToChannels < ActiveRecord::Migration[5.0]
  def change
    add_reference :channels, :parent_comment, foreign_key: { to_table: :comments }, optional: true
  end
end
# author: hosoda
