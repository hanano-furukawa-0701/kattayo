class ItemsController < ApplicationController
  before_action :sign_in_required
  before_action :set_item, only:[:edit, :update, :destroy]

  def index
    @categories = current_user.categories.order('target_amount DESC')
    @items = current_user.items.order('created_at DESC')
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

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
      flash[:notice] = "購入品情報を変更しました"
    else
      render :edit
      flash[:alert] = "購入品情報を変更できませんでした"
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
      flash[:notice] = "購入品を削除しました"
    else
      flash[:alert] = "購入品を削除できませんでした"
    end
  end

  def search
    @items = current_user.items.search(params[:keyword]).order('created_at DESC')
    @categories = current_user.categories.order('target_amount DESC')
  end

  
  private

  def item_params
    params.require(:item).permit(:name, :category_id, :price, :text).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
