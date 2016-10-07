class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :col1
      t.string :col2

      t.timestamps
    end
  end
end
