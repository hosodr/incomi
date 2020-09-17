class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :channel, foreign_key: true
      t.string :name
      t.text :abstract
      t.text :zoom_url
      t.datetime :date
      t.datetime :fromdate
      t.datetime :todate
      t.boolean :delete_flag

      t.timestamps
    end
  end
end
