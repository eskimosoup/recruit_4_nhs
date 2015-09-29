class AddHowHeardToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :how_heard, :string
    add_column :applications, :how_heard_other, :text
  end
end
