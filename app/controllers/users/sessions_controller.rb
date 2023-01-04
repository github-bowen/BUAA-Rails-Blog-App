# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]
  before_action :set_username_and_email, only: [:new]

  # GET /resource/sign_in
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?
    respond_with(resource, serialize_options(resource))
  end

  def set_username_and_email

  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    # set_flash_message!(:notice, :signed_in)
    flash[:notice] = "登录成功！欢迎使用爱旅游！"
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    # set_flash_message! :notice, :signed_out if signed_out
    flash[:noice] = "登出成功！欢迎您再次使用爱旅游！"
    yield if block_given?
    # respond_to_on_destroy
    redirect_to root_path
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password, :email, :username]
  end
end
