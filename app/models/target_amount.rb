class TargetAmount < ApplicationRecord
  belongs_to :user, optional: true
  validates :price, presence: true,  format: { with: /\A[0-9]+\z/}
end
