class AddImageToDailyPlan < ActiveRecord::Migration[5.0]
  def change
    add_attachment :daily_plans, :picture
  end
end
