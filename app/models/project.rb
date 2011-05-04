class Project < ActiveRecord::Base
  belongs_to :user
  has_many :bubbles
  has_many :memberships
  has_many :members, :through => :memberships, :source => :user

  validates_presence_of :name
  validates_presence_of :avatar
  validates_uniqueness_of :name
  validates_uniqueness_of :slug
  validates_format_of :url, :with => /^(#{URI::regexp(%w(http https))})$/, :allow_blank => true

  # We don't want the name of a project to get changed.
  attr_readonly :name

  mount_uploader :avatar, ProjectImageUploader

  before_validation :on => :save do
    generate_slug
  end

  before_validation :on => :create do
    generate_slug
  end

  private
    def generate_slug
      self.slug = self.name.downcase.to_url
    end
end
