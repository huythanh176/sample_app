class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(new create)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_user, only: %i(show destroy)

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    return if @user

    flash[:danger] = t("users.not_exist")
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      @user.send_activation_email
      flash[:info] = t("users.not_activated")
      redirect_to root_path
    else
      flash.now[:danger] = t("users.signup.fail")
      render :new
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t("users.updated")
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t("users.deleted")
    else
      flash[:danger] = t("users.cant_delete")
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
                                 :password_confirmation
  end

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t("users.not_login")
    redirect_to login_url
  end

  def correct_user
    find_user
    return if current_user?(@user)
    flash[:danger]= t("users.edit.permission_denied")
    redirect_to root_url
  end

  def admin_user
    redirect_to root_url unless current_user.is_admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    return @user.nil?
    flash[:danger]= t("users.not_found")
    redirect_to root_url
  end
end
