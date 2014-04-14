class RenameStatusToStatusId < ActiveRecord::Migration
  def change
    rename_column :projects, :status, :status_id
  end
end
