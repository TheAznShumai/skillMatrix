class Profile < ActiveRecord::Base
  belongs_to :user

  validates :telephone, 
            allow_blank: true,
            presence: {format: { with: /\d{3}-\d{3}-\d{4}/, 
                                 message: "Incorrect Phone Format" }}

  def fullname
    "#{first_name} #{last_name}"
  end
end
