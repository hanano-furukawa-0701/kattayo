class CreateTargetAmounts < ActiveRecord::Migration[5.2]
  def change
    create_table :target_amounts do |t|
      t.integer :price,  null: false
      t.timestamps
    end
  end
end
