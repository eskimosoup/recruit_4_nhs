class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, null: false
      t.string :grade, null: false
      t.string :speciality, null: false
      t.string :email, null: false
      t.string :phone_number, null: false
      t.string :date, null: false
      t.text :additional_information
      t.string :cv, null: false

      t.timestamps null: false
    end
  end
end
