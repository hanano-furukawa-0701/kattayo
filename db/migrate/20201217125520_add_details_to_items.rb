class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :year, :date
    add_column :items, :month, :date
    add_column :items, :day, :date
  end
end
