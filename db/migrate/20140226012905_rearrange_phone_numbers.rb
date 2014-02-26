class RearrangePhoneNumbers < ActiveRecord::Migration
  def change
    change_column :profiles, :cell_phone, :string, before: :created_at
    change_column :profiles, :office_phone, :string, before: :created_at
  end
end
