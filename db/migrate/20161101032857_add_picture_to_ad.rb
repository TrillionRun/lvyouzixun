class AddPictureToAd < ActiveRecord::Migration[5.0]
  def change
    add_attachment :advertisements, :picture
    add_column :advertisements, :protocol, :string
  end
end
