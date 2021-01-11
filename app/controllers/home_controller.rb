class HomeController < ApplicationController

  def index
    @target_amount = TargetAmount.where(user_id: current_user.id).first
    # @target_amount_price = TargetAmount.where(user_id: current_user.id).price
    @current_amount = Item.where(created_at: Time.now.all_month).sum(:price)
    
    
    @user_name = current_user.name
    @items = Item.limit(5).order('created_at DESC')
    @categories = Category.limit(5).order('target_amount DESC')
   
    # @category_current_amounts = @category.items.group("CONCAT(YEAR(created_at), MONTH(created_at))").sum(:price)
    # @category_current_amounts.each do |year_month, amount|
    #   if year_month = this_month
    #     @category_current_amount = amount
    #   end
    # end
  end
  
end
