class Project < ActiveRecord::Base
  belongs_to :user

  # Status Enum for collection_select
  STATUS = %w[Closed Open In-Progress Planning Suspended]
end
