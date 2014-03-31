class Attempt < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  belongs_to :survey

  accepts_nested_attributes_for :answers, allow_destroy: true
end
