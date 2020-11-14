class TargetAmount < ApplicationRecord
  belongs_to :user, optional: true
  validates :price, presence: true
end
