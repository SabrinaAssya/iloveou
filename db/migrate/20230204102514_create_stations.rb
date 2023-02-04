class CreateStations < ActiveRecord::Migration[7.0]
  def change
    create_table :stations do |t|
      t.text :name

      t.timestamps
    end
  end
end
