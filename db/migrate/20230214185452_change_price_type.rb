class ChangePriceType < ActiveRecord::Migration[7.0]
  def change
    change_column(:itineraries, :price, :string)
    change_column(:itineraries, :duration, :string)
  end
end
