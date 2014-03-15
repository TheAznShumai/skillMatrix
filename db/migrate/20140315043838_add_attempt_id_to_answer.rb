class AddAttemptIdToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :attempt_id, :integer
  end
end
