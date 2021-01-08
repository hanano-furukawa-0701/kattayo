class HomeController < ApplicationController

  def index
    @target_amount = TargetAmount.where(user_id: current_user.id).first
    # @target_amount_price = TargetAmount.where(user_id: current_user.id).price
    @current_amounts = Item.group("CONCAT(YEAR(created_at), MONTH(created_at))").sum(:price)
    this_month = Date.today.all_month
    @current_amounts.each do |key, value|
      if key = this_month
        @current_amount = value
      end
    end
    @user_name = current_user.name
    @items = Item.limit(5).order('created_at DESC')
    @categories = Category.limit(5).order('target_amount DESC')
  end
  
end
