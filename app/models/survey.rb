class Survey < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :rateable_skills, :dependent => :destroy

  has_many :attempts, :dependent => :destroy

  has_attached_file :icon, :styles => { :small => "120x120>"},
                           :default_url => "document.png"

  acts_as_taggable

  validates_attachment_size :icon, :less_than => 5.megabytes
  validates_attachment_content_type :icon, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :icon, :matches => [/png\Z/, /jpe?g\Z/]

  accepts_nested_attributes_for :questions, allow_destroy: true
  accepts_nested_attributes_for :rateable_skills, allow_destroy: true

  validates :name, presence: true

end

