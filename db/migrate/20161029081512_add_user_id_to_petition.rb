class AddUserIdToPetition < ActiveRecord::Migration[5.0]
  def change
    add_reference :petitions, :user, type: :uuid, null: false, index: true
  end
end
