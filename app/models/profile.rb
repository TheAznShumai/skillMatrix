class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :styles => { :small => "160x160>", 
                                          :thumb => "100x100>" }, 
                                          :default_url => "/images/:style/missing.png"

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
