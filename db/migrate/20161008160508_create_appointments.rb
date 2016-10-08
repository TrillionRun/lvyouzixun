class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :business_id
      t.string :date
      t.string :status

      t.timestamps
    end
  end
end
