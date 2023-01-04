class AdminController < ApplicationController
  before_action :authenticate_user!, except: []
  before_action :authenticate_admin

  before_action :refresh, only: :config_models

  def refresh
    render 'admin/config_models' if current_user.admin?
  end

  def user_list
    @users = User.all.sort_by(&:created_at)
  end

  def destroy_user
    @user = User.find(params[:id])

    if @user.destroy
      redirect_back fallback_location: root_path, notice: "成功删除该账号！"
    else
      flash[:error] = "删除失败！请重试！"
      redirect_back fallback_location: root_path
    end
  end

  def config_models

  end

end
