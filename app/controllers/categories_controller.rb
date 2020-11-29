class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
  end

  private
  def category_params
    params.require(:category).permit(:name, :target_amount).merge(user_id: current_user.id)
  end

end
