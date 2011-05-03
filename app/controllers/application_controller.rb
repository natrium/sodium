class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale

  protected
  def set_locale
    unless params[:lang].nil?
      session[:locale] = params[:lang]
    end
    I18n.locale = session[:locale]
  end

  def authorized? right, project = nil
    return false if current_user.nil?
    return true if current_user.is_admin?

    user = current_user
    if project.members.find_by_id user
      membership = Membership.find_by_user_id_and_project_id user, project
      role = membership.role
    else
      return false
    end

    return !!role.rights.find_by_id(Right.find_by_name(right))
  end
end
