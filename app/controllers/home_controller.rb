class HomeController < ApplicationController

  def index
    @target_amount = TargetAmount.where(user_id: current_user.id).first
    @current_amount = Item.group("MONTH(date)").sum(:price)
    @items = Item.limit(5).order('created_at DESC')
    @categories = Category.limit(5).order('target_amount DESC')
  end
  
end
