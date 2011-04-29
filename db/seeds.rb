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

right_bubbles_delete = Right.create :name => "bubbles.delete"
right_bubbles_create = Right.create :name => "bubbles.create"
right_comments_delete = Right.create :name => "comments.delete"
right_comments_create = Right.create :name => "comments.create"
right_project_delete = Right.create :name => "project.delete"
right_project_edit = Right.create :name => "project.edit"
right_roles_edit = Right.create :name => "roles.edit"
#right_rights_edit = Right.create :name => "rights.edit"


## Role User
# A User can
# create comments for bubbles
role_user.rights << right_comments_create

## Role Contributer
# A Contributer can
# create comments for Bubbles
# create new Bubbles
role_contributor.rights << right_comments_create
role_contributor.rights << right_bubbles_create

## Role Developer
# A Developer can
# create comments for Bubbles
# delete comments for Bubbles
# create new Bubbles
# delete Bubbles
# delete the project if it has no dependencies left
role_developer.rights << right_comments_create
role_developer.rights << right_comments_delete
role_developer.rights << right_bubbles_create
role_developer.rights << right_bubbles_delete
role_developer.rights << right_project_delete

## Role Manager
# A manager can
# create comments for Bubbles
# delete comments for Bubbles
# create new Bubbles
# delete Bubbles
# delete the project if it has no dependencies left
# edit the project properties
# edit the roles of project followers
role_manager.rights << right_comments_create
role_manager.rights << right_comments_delete
role_manager.rights << right_bubbles_create
role_manager.rights << right_bubbles_delete
role_manager.rights << right_project_delete
role_manager.rights << right_project_edit
role_manager.rights << right_roles_edit

admin = User.create :name => 'Admin', :email => 'admin@primus-fatum.de', :password => 'admin123'
Admin.create :user => admin

user1 = User.create :name => 'User1', :email => 'user1@primus-fatum.de', :password => 'user123'
user2 = User.create :name => 'User2', :email => 'user2@primus-fatum.de', :password => 'user123'

project1 = Project.create :name => 'Sample Admin Project', :user => admin,
                         :desc => 'sample admin project'
project2 = Project.create :name => 'Sample User Project', :user => admin,
                         :desc => 'sample user project'

membership1 = Membership.create :project => project1, :role => role_user, :user => user1
membership2 = Membership.create :project => project1, :role => role_manager, :user => admin
membership3 = Membership.create :project => project2, :role => role_developer, :user => user1

admin_bubble1 = Bubble.create(:text => "First Admin Bubble", :user => admin)
admin_bubble2 = Bubble.create(:text => "Second Admin Bubble", :user => admin)
admin_bubble3 = Bubble.create(:text => "First Admin Project Bubble", :user => admin, :project => project1)
admin_bubble4 = Bubble.create(:text => "Second Admin Project Bubble", :user => admin, :project => project1)

user_bubble1 = Bubble.create(:text => "First User Bubble", :user => user1)
user_bubble2 = Bubble.create(:text => "Second User Bubble", :user => user1)

