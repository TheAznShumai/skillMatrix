class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :project_manager_id
      t.string :department
      t.integer :status
      t.timestamps
    end
  end
end
