class TargetAmountsController < ApplicationController

  def edit
    @target_amount = TargetAmount.find(params[:id])
  end

  def update
    @target_amount = TargetAmount.find(params[:id])
    if @target_amount.update(target_amount_params)
      redirect_to root_path
      flash[:notice] = "変更しました"
    else
      render :edit
      flash[:alert] = "変更できませんでした"
    end
  end

  private
  def target_amount_params
    params.require(:target_amount).permit(:price)
  end

end
