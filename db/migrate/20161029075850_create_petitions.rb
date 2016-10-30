class CreatePetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :petitions, id: :uuid do |t|
      t.string :name
      t.string :contact
      t.string :contact_phone
      t.string :email

      t.timestamps
    end
  end
end
