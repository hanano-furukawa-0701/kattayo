class AddDetailsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :year, :date, null: false
    add_column :items, :month, :date, null: false
    add_column :items, :day, :date, null: false
  end
end
