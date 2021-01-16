class Category < ApplicationRecord
  belongs_to :user
  has_many :items, dependent: :destroy
  validates :name, :target_amount, presence: true

  def self.search(search)
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')  
    return @items.all unless search
    Item.where(['name LIKE(?)', "%#{search}%"])
  end

end
