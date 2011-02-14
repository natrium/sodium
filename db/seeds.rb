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

project1 = Project.create :name => 'Sample Admin Project', :user => admin,
                         :desc => 'sample admin project'
project2 = Project.create :name => 'Sample User Project', :user => admin,
                         :desc => 'sample user project'

membership1 = Membership.create :project => project1, :role => role_user, :user => user
membership2 = Membership.create :project => project1, :role => role_manager, :user => admin
membership3 = Membership.create :project => project2, :role => role_manager, :user => user

admin_bubble1 = Bubble.create(:text => "First Admin Bubble", :user => admin)
admin_bubble2 = Bubble.create(:text => "Second Admin Bubble", :user => admin)
admin_bubble3 = Bubble.create(:text => "First Admin Project Bubble", :user => admin, :project => project1)
admin_bubble4 = Bubble.create(:text => "Second Admin Project Bubble", :user => admin, :project => project1)

user_bubble1 = Bubble.create(:text => "First User Bubble", :user => user)
user_bubble2 = Bubble.create(:text => "Second User Bubble", :user => user)

