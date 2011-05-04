class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :role

  validates_uniqueness_of :user_id, :scope => :project_id
  validates_presence_of :project_id
  validates_presence_of :user_id
  validates_presence_of :role_id
end
