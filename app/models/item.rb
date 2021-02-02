class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :price, presence: true,  format: { with: /\A[0-9]+\z/}

  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE(?)', "%#{search}%"])
  end

end
