class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bubbles

  validates_presence_of :name
  validates_presence_of :slug
  validates_uniqueness_of :name
  validates_uniqueness_of :slug
  validates_format_of :url, :with => /^(#{URI::regexp(%w(http https))})$/, :allow_blank => true
end
