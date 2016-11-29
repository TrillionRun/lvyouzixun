class AddLastMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :read_last_message_id, :string
  end
end
