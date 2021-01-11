class HomeController < ApplicationController

  def index
    @target_amount = TargetAmount.where(user_id: current_user.id).first
    @target_amount_price = current_user.target_amount.price
    @current_amount = Item.where(created_at: Time.now.all_month).sum(:price)
    @user_name = current_user.name
    @items = Item.limit(5).order('created_at DESC')
    @categories = Category.limit(5).order('target_amount DESC')
   
  end
  
end
