class Project < ActiveRecord::Base
  belongs_to :user
  validates :name, :description, presence: true
  validates :name, uniqueness: true

  # Status Enum for collection_select
  # Open = 0
  # Planning = 1
  # In-Progress = 2
  # Suspended = 3
  # Closed = 4

  STATUS = %w[Open Planning In-Progress Suspended Closed]

  def project_manager_profile
    Profile.where(:user_id => project_manager_id).first
  end

  def project_manager_full_name
    project_manager_profile.full_name
  end

  def status
    STATUS[status_id]
  end
end

