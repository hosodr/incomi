class CreateHellos < ActiveRecord::Migration[5.0]
  def change
    create_table :hellos do |t|
      t.string :text

      t.timestamps
    end
  end
end
# author: hosoda
