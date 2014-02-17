class Survey < ActiveRecord::Base
    has_many :rateable_skills
    accepts_nested_attributes_for :rateable_skills, allow_destroy: true
    
    validates :name, presence: true
end

