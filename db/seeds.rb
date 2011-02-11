# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

role_manager = Role.create :name => "Manager"
role_developer = Role.create :name => "Developer"
role_contributor = Role.create :name => "Contributor"
role_user = Role.create :name => "User"

right_bubbles_delete = Right.create :name => "Bubbles.delete"
right_bubbles_create = Right.create :name => "Bubbles.create"
right_comments_delete = Right.create :name => "Comments.delete"
right_comments_create = Right.create :name => "Comments.create"
right_project_delete = Right.create :name => "Project.delete"
right_roles_edit = Right.create :name => "Roles.edit"
right_rights_edit = Right.create :name => "Rights.edit"

role_manager.rights << right_bubbles_delete
role_manager.rights << right_bubbles_create
role_manager.rights << right_comments_delete
role_manager.rights << right_comments_create
role_manager.rights << right_project_delete
role_manager.rights << right_roles_edit
role_manager.rights << right_rights_edit

role_developer.rights << right_bubbles_delete
role_developer.rights << right_bubbles_create
role_developer.rights << right_comments_delete
role_developer.rights << right_comments_create
role_developer.rights << right_project_delete
role_developer.rights << right_roles_edit
role_developer.rights << right_rights_edit

role_contributor.rights << right_comments_create
role_contributor.rights << right_bubbles_create

role_user.rights << right_comments_create

admin = User.create :name => 'Admin', :email => 'admin@primus-fatum.de', :password => 'admin123'
user = User.create :name => 'User', :email => 'user@primus-fatum.de', :password => 'user123'

project = Project.create :name => 'Sample Project', :user => admin,
                         :desc => 'sample project', :slug => 'sample'

membership = Membership.create :project => project, :role => user_role, :user => user
