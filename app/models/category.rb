class Category < ApplicationRecord
  belongs_to :user
  validates :name, :target_amount, presence: true
end
