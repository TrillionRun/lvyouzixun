class AddStatusToPetition < ActiveRecord::Migration[5.0]
  def change
    add_column :petitions, :status, :string
  end
end
