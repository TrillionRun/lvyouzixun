class RemoveMessageContent < ActiveRecord::Migration[5.0]
  def change
    drop_table :message_contents
  end
end
