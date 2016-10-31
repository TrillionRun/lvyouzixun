class AddRefToConversation < ActiveRecord::Migration[5.0]
  def change
    add_reference :conversations, :user, type: :uuid
    add_reference :conversations, :business, type: :uuid
  end
end
