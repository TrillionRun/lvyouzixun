class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins, id: :uuid do |t|
      t.string :name
      t.string :pass_word
      t.string :status

      t.timestamps
    end
  end
end
