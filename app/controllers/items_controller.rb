class ItemsController < ApplicationController

  def index
    @categories = Category.order('target_amount DESC')
    @items = Item.limit(5).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
  end

  def category
    @categories = Category.order('target_amount DESC')
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')
  end


  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :text).merge(user_id: current_user.id)
  end

end
