class AddCompanyTypeToPetition < ActiveRecord::Migration[5.0]
  def change
    add_reference :petitions, :company_type, type: :uuid, null: false, index: true
  end
end
