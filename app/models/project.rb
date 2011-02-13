class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bubbles
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  validates_presence_of :name
  validates_presence_of :slug
  validates_uniqueness_of :name
  validates_uniqueness_of :slug
  validates_format_of :url, :with => /^(#{URI::regexp(%w(http https))})$/, :allow_blank => true
  
  before_save :generate_slug

  private
    def generate_slug
      self.slug = self.name.downcase.to_url
    end
end
