# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    #flash[:error] = ['in new!!!']
    super
  end

  # POST /resource
  def create
    # DEFAULT_PERMITTED_ATTRIBUTES = {
    #   sign_in: [:password, :remember_me],
    #   sign_up: [:password, :password_confirmation],
    #   account_update: [:password, :password_confirmation, :current_password]
    # }
    build_resource(sign_up_params)

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        # set_flash_message! :notice, :signed_up
        flash[:notice] = '注册成功！欢迎使用爱旅游！'
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        # set_flash_message! :error, :"signed_up_but_#{resource.inactive_message}"
        # expire_data_after_sign_in!
        # respond_with resource, location: after_inactive_sign_up_path_for(resource)
        # redirect_back_or_to user_registration_path
        if sign_up_params[:username].blank?
          flash[:error] = ['注册失败，输入的用户名为空！']
        elsif sign_up_params[:email].blank?
          flash[:error] = ['注册失败，输入的邮箱为空！']
        elsif User.where(username: sign_up_params[:username]).first
          flash[:error] = ['注册失败，输入的用户名已存在！']
        elsif User.where(email: sign_up_params[:email].downcase).first
          flash[:error] = ['注册失败，输入的邮箱已存在！']
        elsif sign_up_params[:password].length < 6
          flash[:error] = ['注册失败，输入的密码小于6个字符！']
        elsif sign_up_params[:password_confirmation] != sign_up_params[:password]
          flash[:error] = ['注册失败，两次输入的密码不一致！']
        end
        redirect_back_or_to user_registration_path
      end
    else
      # set_flash_message! :error, :"signed_up_but_#{resource.inactive_message}"
      # flash[:error] = ['注册失败，请检查用户名和邮箱']
      # clean_up_passwords resource
      # set_minimum_password_length
      # respond_with resource
      if sign_up_params[:username].blank?
        flash[:error] = ['注册失败，输入的用户名为空！']
      elsif sign_up_params[:email].blank?
        flash[:error] = ['注册失败，输入的邮箱为空！']
      elsif User.where(username: sign_up_params[:username]).first
        flash[:error] = ['注册失败，输入的用户名已存在！']
      elsif User.where(email: sign_up_params[:email].downcase).first
        flash[:error] = ['注册失败，输入的邮箱已存在！']
      elsif sign_up_params[:password].length < 6
        flash[:error] = ['注册失败，输入的密码小于6个字符！']
      elsif sign_up_params[:password_confirmation] != sign_up_params[:password]
        flash[:error] = ['注册失败，两次输入的密码不一致！']
      end
      redirect_back_or_to user_registration_path
    end
  end

  # GET /resource/edit
  def edit
    render 'users/registrations/edit'
  end

  # PUT /resource
  def update
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    # TODO: 用户输入的"当前密码"，不是实际的当前密码，需要验证
    current_password = account_update_params[:current_password]
    # TODO: 新设置的密码
    new_password = account_update_params[:password]
    new_password_again = account_update_params[:password_confirmation]

    yield resource if block_given?

    updating_avatar = new_password.blank? && new_password_again.blank?

    if updating_avatar
      resource_updated = update_resource(resource, account_update_params)
      if resource_updated
        # set_flash_message_for_update(resource, prev_unconfirmed_email)
        flash[:notice] = ['头像更新成功！']
        bypass_sign_in resource, scope: resource
        respond_with resource, location: after_update_path_for(resource)
      else
        flash[:error] = ['头像更新失败！']
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    elsif !(current_user.valid_password? current_password) # 当前密码输错
      flash[:error] = ['账户资料更新失败！当前密码不正确']
      redirect_to edit_user_registration_path
    elsif current_user.valid_password? new_password # 当前密码和新密码一样
      flash[:error] = ['账户资料更新失败！新密码不能与旧密码相同！']
      redirect_to edit_user_registration_path
    elsif new_password.length < 6
      flash[:error] = ['账户资料更新失败！新密码不能小于6个字符！']
      redirect_to edit_user_registration_path
    else
      resource_updated = update_resource(resource, account_update_params)
      if resource_updated
        # set_flash_message_for_update(resource, prev_unconfirmed_email)
        flash[:notice] = ['帐户资料更新成功！']
        bypass_sign_in resource, scope: resource
        respond_with resource, location: after_update_path_for(resource)
      else
        flash[:error] = ['账户资料更新失败！']
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end
  end

  # DELETE /resource
  def destroy
    #flash[:error] = ['in destroy!!!']
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    #flash[:error] = ['in cancel!!!']
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :avatar]
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
