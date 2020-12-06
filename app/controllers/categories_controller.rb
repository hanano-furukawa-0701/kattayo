class CategoriesController < ApplicationController

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
    @categories = Category.order('target_amount DESC')
    @category = Category.find(params[:id])
    @items = @category.items.order('created_at DESC')
    
  end


  private
  def category_params
    params.require(:category).permit(:name, :target_amount).merge(user_id: current_user.id)
  end

end
