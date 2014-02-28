class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name,
            presence: true

  validates :office_phone, :cell_phone, 
            allow_blank: true,
            presence: {format: { with: /\d{3}-\d{3}-\d{4}/, 
                                 message: "Incorrect Phone Format" }}

  def fullname
    "#{first_name} #{last_name}"
  end
end
