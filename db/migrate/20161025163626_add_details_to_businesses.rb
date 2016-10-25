class AddDetailsToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_column :businesses, :details, :text
  end
end
