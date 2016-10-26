class AddPictureToBusinesses < ActiveRecord::Migration[5.0]
  def change
    add_attachment :businesses, :picture
  end
end
