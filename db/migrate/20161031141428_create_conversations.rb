class CreateConversations < ActiveRecord::Migration[5.0]
  def change
    create_table :conversations, id: :uuid do |t|

      t.timestamps
    end
  end
end
