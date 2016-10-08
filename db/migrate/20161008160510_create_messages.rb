class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages, id: :uuid do |t|
      t.uuid :from_id
      t.uuid :to_id
      t.string :status

      t.timestamps
    end
  end
end
