class AddIconToSurvey < ActiveRecord::Migration
  def self.up
    change_table :surveys do |t|
      t.attachment :icon
    end
  end

  def self.down
    drop_attached_file :surveys, :icon
  end
end
