class Bubble < ActiveRecord::Base
  validates_length_of :text, :maximum => 142, :minimum => 1
end
