class SplitTelephoneFieldOnProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :telephone, :string
    add_column :profiles, :office_phone, :string
    add_column :profiles, :cell_phone, :string
  end
end
