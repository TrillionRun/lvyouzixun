class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
      t.string :phone
      t.string :operation
      t.string :code
      t.timestamps
    end
  end
end
