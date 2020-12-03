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

  private
  def category_params
    params.require(:category).permit(:name, :target_amount).merge(user_id: current_user.id)
  end

end
