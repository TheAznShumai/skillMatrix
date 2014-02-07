class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :role, dependent: :destroy
  has_many :skills, dependent: :destroy
  before_create :build_default_role

  def build_default_role
      build_role
      true
  end

  def has_role?(*role_names)
      self.roles.where(:description => role_names).present?
  end

  def is_admin?
      self.has_role?('admin')
  end

end
