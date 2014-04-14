class Project < ActiveRecord::Base
  belongs_to :user

  # Status Enum for collection_select
  # Open = 0
  # Planning = 1
  # In-Progress = 2
  # Suspended = 3
  # Closed = 4

  STATUS = %w[Open Planning In-Progress Suspended Closed]
end
