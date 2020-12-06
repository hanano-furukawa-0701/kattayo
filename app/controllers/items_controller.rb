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
    if @item.valid?
      @item.save
      redirect_to root_path
      flash[:notice] = "購入品を登録しました"
    else
      render :new
      flash[:alert] = "購入品を登録できませんでした"
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :text).merge(user_id: current_user.id)
  end

end
