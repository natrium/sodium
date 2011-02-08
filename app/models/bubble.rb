class Bubble < ActiveRecord::Base
  belongs_to :user

  validates_length_of :text, :maximum => 142, :minimum => 1
  validates_presence_of :user
end
