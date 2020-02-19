class ApplicationController < ActionController::Base
  before_action :set_locale
  protect_from_forgery with: :exception
  include SessionsHelper

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def hello
    render html: "hello, world!"
  end

  private

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t("users.not_login")
    redirect_to login_url
  end
end
