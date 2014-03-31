class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :styles => { :small => "160x160>",
                                          :thumb => "100x100>",
                                          :xsmall => "50x50" },
                                          :default_url => "missing-avatar-:style.png"

  validates_attachment_size :avatar, :less_than => 5.megabytes
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  validates :first_name, :last_name,
            presence: true

  validates :office_phone, :cell_phone,
            allow_blank: true,
            presence: {format: { with: /\d{3}-\d{3}-\d{4}/,
                                 message: "Incorrect Phone Format" }}

  def full_name
    "#{first_name} #{last_name}"
  end
end

