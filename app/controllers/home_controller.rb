class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about, :details]

  def about
  end

  def details
    @user = User.find(params[:id])
    if current_user && @user.id == current_user.id
      redirect_to current_user_details_path
    end
  end

  def current_user_details

  end

  def tourist_routes
  end

  def change_authority
    @user = current_user

    if request.post?
      current_user.update_attribute(:role, current_user.get_pure_reversed_role)
      redirect_to root_path, notice: '更改用户权限成功！当前用户类型为：' + current_user.get_role
    end
  end

  private

  def set_user
    @user = params[:user]
  end
end
