class AllowNulls < ActiveRecord::Migration
  def change
    change_column :applications, :name, :string, null: true
    change_column :applications, :grade, :string, null: true
    change_column :applications, :speciality, :string, null: true
    change_column :applications, :email, :string, null: true
    change_column :applications, :phone_number, :string, null: true
    change_column :applications, :date, :string, null: true
    change_column :applications, :cv, :string, null: true
  end
end
