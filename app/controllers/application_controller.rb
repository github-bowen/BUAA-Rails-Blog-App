class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :authenticate_admin

  before_action :configure_permitted_parameters, if: :devise_controller?

  # before_action :set_default_image, except: []
  # def set_default_image
  #   @default_img ||= File.open('app/assets/images/empty_blog_img.png').read
  # end

  add_flash_types :error, :warning

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def authenticate_admin
    unless current_user.admin?
      flash[:warning] = ["抱歉！您没有权限访问管理员页面。"]
      redirect_back fallback_location: root_path
    end
  end
end
