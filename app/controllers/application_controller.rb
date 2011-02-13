class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  protected
  def set_locale
    unless params[:lang].nil?
      session[:locale] = params[:lang]
    end
    I18n.locale = session[:locale]
    puts "Language: " + params[:lang].to_s + " Session: " + session[:locale]
  end
end
