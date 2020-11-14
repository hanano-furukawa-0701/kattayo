class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, full: false
      t.integer :target_amount, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
