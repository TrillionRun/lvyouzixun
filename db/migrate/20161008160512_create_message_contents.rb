class CreateMessageContents < ActiveRecord::Migration[5.0]
  def change
    create_table :message_contents, id: :uuid do |t|
      t.uuid :message_id
      t.text :content

      t.timestamps
    end
  end
end
