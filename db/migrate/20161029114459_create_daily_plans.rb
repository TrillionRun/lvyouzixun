class CreateDailyPlans < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_plans, id: :uuid do |t|
      t.string :places
      t.string :dates
      t.string :description
      t.string :food
      t.string :hotel

      t.timestamps
    end
  end
end
