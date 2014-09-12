class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale, :set_site_owner
  def set_locale
    I18n.default_locale = :en
    I18n.locale = params[:locale].present? ? params[:locale] : I18n.default_locale
  end

  def set_site_owner
    @site_owner = Person.find(1)
  end

end
