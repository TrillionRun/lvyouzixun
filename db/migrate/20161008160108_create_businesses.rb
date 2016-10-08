class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses, id: :uuid do |t|
      t.uuid :user_id
      t.string :name
      t.string :image_url
      t.string :company_name
      t.string :email
      t.string :phone
      t.uuid :company_type_id
      t.string :status

      t.timestamps
    end
  end
end
