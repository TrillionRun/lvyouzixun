class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :object_id
      t.string :status

      t.timestamps
    end
  end
end
