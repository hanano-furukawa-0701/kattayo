class RemoveYearToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :year, :date
    remove_column :items, :month, :date
    remove_column :items, :day, :date
  end
end
