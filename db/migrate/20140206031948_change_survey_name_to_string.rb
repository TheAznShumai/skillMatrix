class ChangeSurveyNameToString < ActiveRecord::Migration
  def change
      change_column :surveys, :name, :string
  end
end
