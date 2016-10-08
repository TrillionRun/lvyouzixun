class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :name
      t.string :nickname
      t.string :image_url
      t.string :last_sign_in
      t.string :role
      t.string :phone
      t.string :status


      t.timestamps
      t.index :phone,  unique: true
    end
  end
end
