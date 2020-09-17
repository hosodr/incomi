class AddHostuserToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :host_user, foreign_key: { to_table: :users }
  end
end
