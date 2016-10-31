class AddRefToMessage < ActiveRecord::Migration[5.0]
  def change
    add_reference :messages, :conversation, type: :uuid
  end
end
