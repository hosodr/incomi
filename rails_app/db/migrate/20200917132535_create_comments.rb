class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :channel, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
# author: hosoda
