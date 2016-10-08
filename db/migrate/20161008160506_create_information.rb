class CreateInformation < ActiveRecord::Migration[5.0]
  def change
    create_table :information, id: :uuid do |t|
      t.uuid :business_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
