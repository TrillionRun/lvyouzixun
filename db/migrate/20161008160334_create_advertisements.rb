class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements, id: :uuid do |t|
      t.string :ad_url
      t.string :status
      t.string :image_url

      t.timestamps
    end
  end
end
