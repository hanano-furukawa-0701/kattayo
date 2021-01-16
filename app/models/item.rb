class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category

  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE(?)', "%#{search}%"])
  end

end
