class AddColumnsToAppointment < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :name, :string
    add_column :appointments, :phone, :string
    add_column :appointments, :description, :text
  end
end
