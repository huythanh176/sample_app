class PasswordResetsController < ApplicationController
  before_action :get_user, only: %i(edit update)
  before_action :valid_user, only: %i(edit update)

  def new
  end

  def edit
  end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t("users.signin.forgot_password_info")
      redirect_to root_url
    else
      flash.now[:danger] = t("users.signin.email_not_found")
      render :new
    end
  end

  def update
    if params[:user][:password].empty?
      @user.errors.add(:password, t("users.signin.password_invalid"))
      render :edit
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = t("users.signin.password_reset_success")
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def get_user
    @user = User.find_by email: params[:email]
  end

  def valid_user
    return if @user && @user.activated? && @user.authenticated?(:reset, params[:id])
    redirect_to root_url
  end

  private
  def user_params
    params.require(:user).permit :password, :password_confirmation
  end
end
