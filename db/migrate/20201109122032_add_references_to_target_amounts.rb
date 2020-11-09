class AddReferencesToTargetAmounts < ActiveRecord::Migration[5.2]
  def change
    add_reference :target_amounts, :user, null: false, foreign_key: true
  end
end
