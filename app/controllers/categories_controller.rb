class CategoriesController < ApplicationController
  before_action :sign_in_required

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to root_path
      flash[:notice] = "カテゴリーを追加しました"
    else
      render :new
      flash[:alert] = "カテゴリーが追加できませんでした"
    end
  end

  def show
    @categories = current_user.categories.order('target_amount DESC')
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')  
    @category_current_amount = @items.where(created_at: Time.now.all_month).sum(:price)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to category_path(@category.id)
      flash[:notice] = "カテゴリー情報を変更しました"
    else
      render :edit
      flash[:alert] = "カテゴリー情報を変更できませんでした"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      redirect_to root_path
      flash[:notice] = "カテゴリーを削除しました"
    else
      flash[:alert] = "カテゴリーを削除できませんでした"
    end
  end

  def search
    @category = Category.find(params[:id])
    @items = @category.items.search(params[:keyword]).order('created_at DESC')
    @categories = current_user.categories.order('target_amount DESC')
    @category_current_amount = @items.where(created_at: Time.now.all_month).sum(:price)
  end


  private
  def category_params
    params.require(:category).permit(:name, :target_amount).merge(user_id: current_user.id)
  end

end
