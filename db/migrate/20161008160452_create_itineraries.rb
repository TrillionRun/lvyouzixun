class CreateItineraries < ActiveRecord::Migration[5.0]
  def change
    create_table :itineraries, id: :uuid do |t|
      t.uuid :business_id
      t.string :name

      t.timestamps
    end
  end
end
