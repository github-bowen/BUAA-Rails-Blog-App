class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:about]
  def about
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
end
