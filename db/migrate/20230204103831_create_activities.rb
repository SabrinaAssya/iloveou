class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.references :itinerary, null: false, foreign_key: true
      t.text :title
      t.text :address
      t.text :description
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
