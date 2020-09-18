class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :channel, foreign_key: true
      t.string :name
      t.text :abstract
      t.text :zoom_url
      t.datetime :host_date
      t.datetime :from_date
      t.datetime :to_date
      t.boolean :is_delete, default: false, null: false

      t.timestamps
    end
  end
end
