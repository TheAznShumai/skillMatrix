class Survey < ActiveRecord::Base
  has_many :rateable_skills
  has_attached_file :icon, :styles => { :ipod => "120x120>"},
                           :default_url => "document.png"

  validates_attachment_size :icon, :less_than => 5.megabytes
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :icon, :matches => [/png\Z/, /jpe?g\Z/]
  accepts_nested_attributes_for :rateable_skills, allow_destroy: true

  validates :name, presence: true

end

