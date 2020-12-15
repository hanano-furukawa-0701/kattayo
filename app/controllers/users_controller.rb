class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path
      flash[:notice] = "ユーザー情報を編集しました"
    else
      render :edit
      flash[:alert] = "ユーザー情報を編集できませんでした"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name)
    params.require(:target_amount).permit(:price)
  end
end
