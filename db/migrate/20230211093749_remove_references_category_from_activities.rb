class RemoveReferencesCategoryFromActivities < ActiveRecord::Migration[7.0]
  def change
    remove_reference :activities, :category, index: true, foreign_key: true
  end
end
