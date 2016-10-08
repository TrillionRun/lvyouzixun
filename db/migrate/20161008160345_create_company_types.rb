class CreateCompanyTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :company_types, id: :uuid do |t|
      t.string :name
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
