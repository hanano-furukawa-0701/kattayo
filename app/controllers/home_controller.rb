class HomeController < ApplicationController

  def index
    @items = Item.limit(5).order('created_at DESC')
    @categories = Category.limit(5).order('target_amount DESC')
  end
  
end
