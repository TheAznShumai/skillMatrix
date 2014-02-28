class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :authentication_keys => [:login]

  has_one :profile, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :ratings, through: :skills

  accepts_nested_attributes_for :profile

  # HTML 5 Validates on these values below
  validates :login, :password, :password_confirmation, 
    :presence => true

  validates :username, :email,
    :presence => true,
    :uniqueness => {
    :case_sensitive => false
  }

    attr_accessor :login

    private

    def login=(login)
      @login = login
    end

    def login
      @login || self.username || self.email
    end

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
