class AddDefaultRating < ActiveRecord::Migration
  def change
      change_column :ratings, :score, :integer, :default => 0
  end
end
