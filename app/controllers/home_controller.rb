class HomeController < ApplicationController
  before_action :sign_in_required

  def index
    @target_amount = TargetAmount.where(user_id: current_user.id).first
    @target_amount_price = current_user.target_amount.price
    @current_amount = current_user.items.where(created_at: Time.now.all_month).sum(:price)
    @user_name = current_user.name
    @categories = current_user.categories.limit(5).order('target_amount DESC')
    @items = current_user.items.limit(5).order('created_at DESC')
   
  end
  
end
