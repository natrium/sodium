class User < ActiveRecord::Base
  include Gravtastic

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  # , :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :name

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  has_many :bubbles
  has_many :projects
  has_many :memberships
  has_many :followed_projects, :through => :memberships, :source => :project
  
  has_one :admin

  def is_admin?
    !admin.nil?
  end

  def follows_project? project
    followed_projects.include? project
  end

  gravtastic :size => 64

end
