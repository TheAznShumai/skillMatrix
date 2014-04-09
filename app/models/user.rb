class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, :dependent => :destroy

  has_many :user_skills, :dependent => :destroy
  has_many :skills,  :through => :user_skills
  has_many :ratings, :through => :user_skills, :dependent => :destroy

  has_many :attempts, :dependent => :destroy
  has_many :surveys, :through => :attempts

  belongs_to :manager, :class_name => 'User'
  has_many :employees, :class_name => 'User', :foreign_key => 'manager_id'

  accepts_nested_attributes_for :profile

  # HTML 5 Validates on these values below
  validates :password, :password_confirmation,
            :presence => true

  validates :username, :email,
            :presence => true,
            :uniqueness => { :case_sensitive => false }

  # Login accessor for the user to pick username/email for login
  attr_accessor :login

  private

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = lower(:value) OR lower(email) = lower(:value)",
                               { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end
end

