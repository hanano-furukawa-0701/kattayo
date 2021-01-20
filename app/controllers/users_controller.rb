class UsersController < ApplicationController
  before_action :sign_in_required
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
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
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
