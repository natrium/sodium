module ApplicationHelper
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
