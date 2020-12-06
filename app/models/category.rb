class Category < ApplicationRecord
  belongs_to :user
  has_many :items
  validates :name, :target_amount, presence: true
end
