class AddVideoToBusiness < ActiveRecord::Migration[5.0]
  def change
    add_attachment :businesses, :video
  end
end
